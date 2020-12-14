<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:cps="cpsframework"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns="http://www.w3.org/1999/xhtml" 
	xmlns:l="lookup"
	exclude-result-prefixes="msxsl l">
	
	<xsl:import href="Utils.xsl"/>
	
	<!--Create and store aspect lookup table. This is stored as a sting
		and must be converted back into an xml tree fragment.-->
	<xsl:variable name="AspectLookupTableString">
		<xsl:call-template name="CreateAspectLookup"/>
	</xsl:variable>
		
	<!--Turns the Aspect lookup table back into an xml tree fragment.-->
	<xsl:variable name="AspectLookupTable" select="msxsl:node-set($AspectLookupTableString)"/>	
	
	<!--Creates an intermediary xml document based on all the Asepcts in the source document
		in order to generate the Requirements table and create links to the rest of the document.-->
	<xsl:template name="CreateAspectLookup">
		<xsl:for-each select="//Aspects">
			<l:entry>
				<xsl:attribute name="id">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:attribute>
				<xsl:attribute name="number">
					<xsl:value-of select="position()"/>
				</xsl:attribute>
				<xsl:copy-of select="."/>
			</l:entry>
		</xsl:for-each>
	</xsl:template>
	
	<!--Get the number for the given Aspects Node.-->
	<xsl:template match="Aspects" mode="GetAspectNumber">
		<xsl:variable name="currentId" select="generate-id(.)"/>
		<xsl:value-of select="$AspectLookupTable/l:entry[@id=$currentId]/@number"/>
	</xsl:template>
	
	<!--Generates an aspect table with the Aspects that are children of the
		given parent nodes.-->
	<xsl:template name="GenerateAspectsTable">
		<xsl:param name="id"/>
		<xsl:param name="aspectNodes"/>
		
		<h2>
			Requirements
		</h2>
		<table id="{$id}">
			<tr>
				<th colspan="2">Requirements</th>
			</tr>
			
			<tr>
				<th>R-ID</th>
				<th>Details</th>
			</tr>
			
			<xsl:for-each select="$aspectNodes">
				<xsl:variable name="currentId" select="generate-id(.)"/>
				<xsl:apply-templates select="$AspectLookupTable/l:entry[@id=$currentId]"/>
			</xsl:for-each>
		</table>
	</xsl:template>
	
	<!--This template generates rows for the Requirements table based on the entries in the AspectLookupTable variable.-->
	<xsl:template match="l:entry">
		<tr>
			<td>
				<p>
					<xsl:value-of select="@number"/>
				</p>
			</td>
			<td>
				<xsl:apply-templates select="Aspects" mode="GeneratePaths"/>
			</td>
		</tr>
	</xsl:template>
	
	<!--Generates elemtn paths for the given Aspects node.-->
	<xsl:template match="Aspects" mode="GeneratePaths">
		<xsl:for-each select="*">
			<xsl:call-template name="CreateAspectElementPaths">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	
	<!--Generates the entries for the Details column of the Requirements table. First the path of the node is output and the statement inside any
		Property nodes are output joined with '; '.-->
	<xsl:template name="CreateAspectElementPaths">
		<xsl:param name="node"/>
		<xsl:param name="path" select="''"/>
		
		<!--Create the path of the current node. If this is the first node, do not add a '/' before it.-->
		<xsl:variable name="newPath">
			<xsl:if test="$path != ''">
				<xsl:value-of select="concat($path, '/')"/>
			</xsl:if>
			<xsl:value-of select="name($node)"/>
		</xsl:variable>		
		
		<!--If this node has at least one Property node after it, output an entry.-->
		<xsl:if test="$node/Property">
			<xsl:call-template name="OutputProperties">
				<xsl:with-param name="path" select="$newPath"/>
				<xsl:with-param name="nodes" select="$node/Property"/>
			</xsl:call-template>
		</xsl:if>		
		
		<!--For the remaining sub-nodes that are not type Property, recurse with the path of this node as the new paramater.-->
		<xsl:for-each select="$node/*[name() != 'Property']">
			<xsl:call-template name="CreateAspectElementPaths">
				<xsl:with-param name="node" select="."/>
				<xsl:with-param name="path" select="$newPath"/>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	
	<!--Creates a div grouping for a property name and its sub-table.-->
	<xsl:template name="OutputProperties">
		<xsl:param name="path"/>
		<xsl:param name="nodes"/>
		
		<div>
			<div style="display: inline-block; vertical-align: middle;">
				<p>
					<xsl:value-of select="concat($path, ':')"/>
				</p>
			</div>
			<div style="display: inline-block; vertical-align: middle;margin: 4px">
				<xsl:apply-templates select="$nodes"/>
			</div>
		</div>
	</xsl:template>
	
	<!--Outputs a table for all of a property's elements.-->
	<xsl:template match="Property">
		<table style="margin: 8px;">
			<xsl:if test="description">
				<tr>
					<th>Description</th>
					<td>
						<p>
							<xsl:value-of select="description"/>
						</p>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="priority">
				<tr>
					<th>Priority</th>
					<td>
						<p>
							<xsl:value-of select="priority"/>
						</p>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="reference">
				<tr>
					<th>References</th>
					<td>
						<p>
							<xsl:call-template name="StringJoin">
								<xsl:with-param name="values" select="reference"/>
								<xsl:with-param name="joinString" select="', '"/>
							</xsl:call-template>
						</p>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="statement">
				<tr>
					<th>Statement</th>
					<td>
						<p>
							<xsl:value-of select="statement"/>
						</p>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="trace">
				<tr>
					<th>Trace</th>
					<td>
						<p>
							<xsl:value-of select="trace"/>
						</p>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	
</xsl:stylesheet>
