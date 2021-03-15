<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
	xmlns:cps="cpsframework"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns="http://www.w3.org/1999/xhtml" 
	exclude-result-prefixes="msxsl" 
	version="1.0">
	
	<xsl:import href="AspectsUtils.xsl"/>
	
	<xsl:output method="xml" version="4.0" encoding="UTF-8" omit-xml-declaration="yes" indent="yes"/>
	
	<xsl:template match="/" name="initial-template">
		<html>
			<head>
				<meta name="generator" content="HTML Tidy for Windows (vers 14 October 2008), see www.w3.org"/>
				<meta http-equiv="Content-Type" content="text/html; charset=us-ascii"/>
				<meta name="Generator" content="Microsoft Word 14 (filtered)"/>
				<style type="text/css">
					/*<![CDATA[*/
					<!--
					 /* Font Definitions */
					 @font-face
							{font-family:Cambria;
							panose-1:2 4 5 3 5 4 6 3 2 4;}
					@font-face
							{font-family:Tahoma;
							panose-1:2 11 6 4 3 5 4 4 2 4;}
					@font-face
							{font-family:"Arial Narrow";
							panose-1:2 11 6 6 2 2 2 3 2 4;}
					 /* Style Definitions */
					 p
							{margin:0in;
							margin-top:4px;
							margin-bottom:4px;
							text-align:justify;
							font-size:10.0pt;
							font-family:"Arial","sans-serif";
							letter-spacing:.4pt;}
					h1
							{mso-style-link:"Heading 1 Char";
							margin-top:24.0pt;
							margin-right:0in;
							margin-bottom:0in;
							margin-left:0in;
							margin-bottom:.0001pt;
							text-align:justify;
							page-break-after:avoid;
							font-size:14.0pt;
							font-family:"Cambria","serif";
							color:#365F91;
							letter-spacing:.4pt;}
					h2
							{mso-style-link:"Heading 2 Char";
							margin-top:10.0pt;
							margin-right:0in;
							margin-bottom:0in;
							margin-left:0in;
							margin-bottom:.0001pt;
							text-align:justify;
							page-break-after:avoid;
							font-size:13.0pt;
							font-family:"Cambria","serif";
							color:#4F81BD;
							letter-spacing:.4pt;}
					@page WordSection1
							{size:11.0in 8.5in;
							margin:1.0in 1.0in 1.0in 1.0in;}
					div.WordSection1
							{page:WordSection1;}
					td
						{border:solid windowtext 1.0pt;
						padding:0in 5.4pt 0in 5.4pt;
						height:11.8pt;
						vertical-align: text-top}
					table
						{width:100.0%;
						border-collapse:collapse;
						border:none}
					th
						{border:solid windowtext 1.0pt;
						background:#CCCCCC;
						padding:0in 5.4pt 0in 5.4pt;
						height:10.75pt;
						text-align:left;
						mso-style-name:TableHeading;
						mso-style-link:"TableHeading Char";
						margin:0in;
						margin-bottom:.0001pt;
						font-size:10.0pt;
						font-family:"Arial","sans-serif";
						color:#002060;
						letter-spacing:.4pt;
						font-weight:bold;
						font-style:italic;}
					-->
					/*]]>*/
				</style>
				<!--<title></title>-->
				<xsl:text disable-output-escaping="yes">&lt;title&gt;&lt;/title&gt;</xsl:text>
			</head>
			<body>
				<h1>
					0       Description of the Business Case
				</h1>			
				<table id="0">
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Domain(s)</th>
						<th>Description</th>
						<th>Requirements R-ID</th>
						<th>Type</th>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/BusinessCase"/>
					
				</table>
				
				<xsl:call-template name="GenerateAspectsTable">
					<xsl:with-param name="id" select="'0.1'"/>
					<xsl:with-param name="aspectNodes" select="cps:CPSFramework/BusinessCase//Aspects"/>
				</xsl:call-template> 
			
				<h1>
					1       Description of the Use Case
				</h1>
				<h2>
					1.1    Name of Use Case
				</h2>
				<table id="1.1">
					<tr>
						<th colspan="3">Use Case Identification</th>
					</tr>
					<tr>
						<th>ID</th>
						<th>Name of Use Case</th>
						<th>Description</th>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/UseCase"/>
					
				</table>
				
				<h2>
					1.2    Version Management
				</h2>
				<table id="1.2">
					<tr>
						<th colspan="7">Version Management</th>
					</tr>
					<tr>
						<th>Version Management Changes</th>
						<th>Date</th>
						<th>Name, Author(s), or Committee</th>
						<th>Approval Status, draft, for comments, for voting, final</th>
						<th>Version Number</th>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/UseCase/Version"/>
					
				</table>
				
				<table id="1.2.1" style="margin-top:16px">
					<tr>
						<th colspan="5">Maturity</th>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/Maturity"/>
					
				</table>
				
				<h2>
					1.3    Scope and Objectives of Use Case
				</h2>
				<table id="1.3">
					<tr>
						<th colspan="2">Scope and Objectives of Use Case</th>
					</tr>
					
					<xsl:call-template name="ScopeAndObjectives"/>
					
				</table>
				
				<h2>
					1.4    Narrative of Use Case
				</h2>
				<table id="1.4">
					<tr>
						<th>Narrative of Use Case</th>
					</tr>

					<xsl:apply-templates select="cps:CPSFramework/UseCase/Narrative"/>					
					
				</table>
				
				<h2>
					1.5    General Remarks
				</h2>
				<table id="1.5">
					<tr>
						<th>General Remarks</th>
					</tr>

					<xsl:apply-templates select="cps:CPSFramework/UseCase/Remark"/>

				</table>
				
				<h1>
					2       Diagrams of Use Case
				</h1>
				<table id="2">
					<tr>
						<th>Diagram of the Use Case</th>
					</tr>
					<tr>
						<td>
							<xsl:apply-templates select="/cps:CPSFramework/UseCase/Drawing"/>
						</td>
					</tr>
				</table>
				
				<h1>
					3       Technical Details
				</h1>
				<h2>
					3.1    Actors: People, Systems, Applications, Databases, the Power System, and Other Stakeholders
				</h2>
				
				<xsl:apply-templates select="cps:CPSFramework/UseCase/CPSGrouping"/>
				
				<h2>
					3.2    Preconditions, Assumptions, Post condition, Events
				</h2>
				<table id="3.2">
					<tr>
						<th colspan="4">Use Case Conditions</th>
					</tr>
					<tr>
						<th>Assumption name</th>
						<th>Assumption content</th>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/UseCase/Assumption"/>
					
				</table>
					
				<table id="3.3">
					<tr>
						<th>Prerequisite name</th>
						<th>Prerequisite content</th>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/UseCase/Prerequisite"/>
					
				</table>
				
				<h2>
					3.3    References / Issues
				</h2>
				<table id="3.4">
					<tr>
						<th colspan="8">References</th>
					</tr>
					<tr>
						<th>No.</th>
						<th>References Type</th>
						<th>Reference</th>
						<th>Description</th>
						<th>Status</th>
						<th>Impact on Use Case</th>
						<th>Originator / Organisation</th>
						<th>Link</th>
					</tr>
						
					<xsl:apply-templates select="cps:CPSFramework/UseCase/Reference"/>
					
				</table>				
				
				<h2>
					3.4    Further Information to the Use Case for Classification / Mapping
				</h2>				
				<table id="3.5">				
					<tr>
						<th colspan="6">Classification Information</th>
					</tr>
					<tr>
						<th>Relation to Other Use Cases</th>
						<th>Level of Depth</th>
						<th>Prioritisation</th>
						<th>Generic, Regional or National Relation</th>
						<th>View</th>
						<th>Further Keywords for Classification</th>
					</tr>
					
					<xsl:call-template name="FurtherInformation"/>
					
				</table>
				
				<h2>
					3.5 Custom Information
				</h2>
				<table id="3.6">
					<tr>
						<th>Key</th>
						<th>Reference</th>
						<th>Value</th>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/UseCase/CustomInformation"/>
				</table>
				
				<h2>
					3.6 Performance Indicators
				</h2>
				<table id="3.7">
					<tr>
						<th>Name</th>
						<th>Description</th>
						<th>Objective</th>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/UseCase/KeyPerformanceIndicator"/>
				</table>
				
				<h1>4       Step by Step Analysis of Use Case
				</h1>
				<table id="4">
					<tr>
						<th colspan="7">Scenario Conditions</th>
					</tr>
					<tr>
						<th>No.</th>
						<th>Scenario Name</th>
						<th>Description</th>
						<th>Primary Actor</th>
						<th>Triggering Event</th>
						<th>Pre-Condition</th>
						<th>Post-Condition</th>
						<th>Requirements R-ID</th>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/UseCase/Scenario" mode="ScenarioTable"/>
					
				</table>
				
				<xsl:call-template name="GenerateAspectsTable">
					<xsl:with-param name="id" select="'4.0.1'"/>
					<xsl:with-param name="aspectNodes" select="cps:CPSFramework/UseCase//Aspects"/>
				</xsl:call-template> 

				<xsl:apply-templates select="cps:CPSFramework/UseCase/Scenario" mode="ScenarioStepsTable"/>
				
				<h1>
					5       Information Exchanged
				</h1>
				<table id="5">
					<tr>
						<th colspan="5">Information Maturity</th>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/InformationModelLibrary/Maturity"/>
					
				</table>
				
				<table id="5.0.1" style="margin-top:16px">
					<tr>
						<th colspan="4">Information Exchanged</th>
					</tr>
					<tr>
						<th>Name of Information Exchanged</th>
						<th>Description of Information Exchanged</th>
						<th>Requirements to information data R-ID</th>
						<th>Requirements R-ID</th>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/InformationModelLibrary/InformationModel"/>
					
				</table>

				<xsl:call-template name="GenerateAspectsTable">
					<xsl:with-param name="id" select="'5.0.2'"/>
					<xsl:with-param name="aspectNodes" select="cps:CPSFramework/InformationModelLibrary//Aspects"/>
				</xsl:call-template>
			
				<h1>
					6       Interactions
				</h1>
				
				<h2>
					6.1 Interaction Libary Maturity
				</h2>	
				<table id="6.1">
					<tr>
						<th colspan="5">Interaction Maturity</th>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/InteractionLibrary/Maturity"/>
					
				</table>
				
				<h2>
					6.2 Influences
				</h2>
				<table id="6.2">
					<tr>
						<th colspan="3">Influences</th>
					</tr>
					<tr>
						<th>Name</th>
						<th>Description</th>
						<th>Requirement R-ID</th>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/InteractionLibrary/Influences/influence"/>
					
				</table>
				
				<xsl:call-template name="GenerateAspectsTable">
					<xsl:with-param name="id" select="'6.2.1'"/>
					<xsl:with-param name="aspectNodes" select="cps:CPSFramework/InteractionLibrary/Influences//Aspects"/>
				</xsl:call-template>
				
				<h2>
					6.3 Messages
				</h2>
				<table id="6.3">
					<tr>
						<th colspan="3">Messages</th>
					</tr>
					<tr>
						<th>Name</th>
						<th>Description</th>
						<th>Requirement R-ID</th>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/InteractionLibrary/Messages/message"/>
					
				</table>

				<xsl:call-template name="GenerateAspectsTable">
					<xsl:with-param name="id" select="'6.3.1'"/>
					<xsl:with-param name="aspectNodes" select="cps:CPSFramework/InteractionLibrary/Messages//Aspects"/>
				</xsl:call-template>
				
				<h1>
					7 CPS Library
				</h1>				
				
				<h2>
					7.1 CPS List
				</h2>
				<table id="7.1">
					<tr>
						<th colspan="8">CPS List</th>
					</tr>
					<tr>
						<th>Identifier</th>
						<th>Name</th>
						<th>Description</th>
						<th>Type</th>
						<th>Domains</th>
						<th>Requirements R-ID</th>
						<th>Logical</th>
						<th>Physical</th>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/CPSLibrary/cps"/>
					<xsl:apply-templates select="cps:CPSFramework/CPSLibrary//IrreducibleCPS"/>
					
				</table>
				
				<h2>7.2 Systems</h2>
				<table id="7.2">
					<tr>
						<th>Identifier</th>
						<th>Name</th>
						<th>Description</th>
						<th>Type</th>
						<th>Requirements R-ID</th>
						<th>Domains</th>
						<th>Human</th>
						<th>Irreducible CPS</th>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/CPSLibrary/system"/>
					<xsl:apply-templates select="cps:CPSFramework/CPSLibrary//System"/>
					
				</table>
				
				<h2>System Human Elements</h2>
				<table id="7.2.1">
					<tr>
						<th>Identifier</th>
						<th>Name</th>
						<th>Description</th>
						<th>Type</th>
						<th>Domains</th>
						<th>Physical</th>
						<th>Requirements R-ID</th>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/CPSLibrary/system/Human"/>
					<xsl:apply-templates select="cps:CPSFramework/CPSLibrary//System/Human"/>
				</table>
				
				<h2>7.3 System of Systems</h2>
				<table id="7.3">
					<tr>
						<th>Identifier</th>
						<th>Name</th>
						<th>Description</th>
						<th>Type</th>
						<th>Domains</th>
						<th>System List</th>
						<th>Requirements R-ID</th>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/CPSLibrary/systemofsystems"/>
				</table>
				
				<xsl:call-template name="GenerateAspectsTable">
					<xsl:with-param name="id" select="'7.0.1'"/>
					<xsl:with-param name="aspectNodes" select="cps:CPSFramework/CPSLibrary//Aspects"/>
				</xsl:call-template>		
				
				<table id="7.4">
					<tr>
						<th colspan="5">Maturity</th>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/CPSLibrary/Maturity"/>
				</table>
				
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="KeyPerformanceIndicator">
		<tr>
			<td>
				<xsl:attribute name="id">
					<xsl:value-of select="technicalId"/>
				</xsl:attribute>
			
				<xsl:value-of select="name"/>
			</td>
			<td>
				<xsl:value-of select="description"/>
			</td>
			<td>
				<xsl:for-each select="Objective">
					<p>
						<xsl:value-of select="technicalId"/>
					</p>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="CustomInformation">
		<tr>
			<td>
				<xsl:value-of select="key"/>
			</td>
			<td>
				<xsl:value-of select="reference"/>
			</td>
			<td>
				<xsl:value-of select="value"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="systemofsystems">
		<tr>
			<td>
				<p>
					<xsl:attribute name="id">
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
					
					<xsl:value-of select="identifier"/>
				</p>
			</td>
			
			<td>
				<p>
					<xsl:value-of select="name"/>
				</p>
			</td>
			
			<td>
				<p>
					<xsl:value-of select="description"/>
				</p>
			</td>
			
			<td>
				<p>
					<xsl:value-of select="type"/>
				</p>
			</td>
			
			<td>
				<xsl:apply-templates select="Domain"/>
			</td>

			<td>
				<xsl:for-each select="System">
					<p>
						<xsl:value-of select="identifier"/>
					</p>
				</xsl:for-each>
			</td>

			<td>
				<p>
					<xsl:apply-templates select="Aspects" mode="GetAspectNumber"/>
				</p>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="system">
		<tr>
			<xsl:attribute name="id">
				<xsl:text>system</xsl:text>
			</xsl:attribute>
			
			<xsl:call-template name="GenerateSystemContent"/>
		</tr>
	</xsl:template>
	
	<xsl:template match="System">
		<tr>
			<xsl:attribute name="id">
				<xsl:text>system-of-systems</xsl:text>
			</xsl:attribute>
			
			<xsl:call-template name="GenerateSystemContent"/>
		</tr>
	</xsl:template>	
	
	<xsl:template name="GenerateSystemContent">
		<td>
			<p>
				<xsl:attribute name="id">
					<xsl:value-of select="technicalId"/>
				</xsl:attribute>
				
				<xsl:value-of select="identifier"/>
			</p>
		</td>
		
		<td>
			<p>
				<xsl:value-of select="name"/>
			</p>
		</td>
		
		<td>
			<p>
				<xsl:value-of select="description"/>
			</p>
		</td>
		
		<td>
			<p>
				<xsl:value-of select="type"/>
			</p>
		</td>
		
		<td>
			<p>
				<xsl:apply-templates select="Aspects" mode="GetAspectNumber"/>
			</p>
		</td>
		
		<td>
			<xsl:apply-templates select="Domain"/>
		</td>
		
		<td>
			<xsl:for-each select="Human/identifier">
				<p>
					<xsl:value-of select="."/>
				</p>
			</xsl:for-each>
		</td>
		
		<td>
			<xsl:for-each select="IrreducibleCPS">
				<p>
					<xsl:value-of select="identifier"/>
				</p>
			</xsl:for-each>
		</td>
	</xsl:template>
	
	<xsl:template match="Human">
		<tr>
			<td>
				<p>
					<xsl:value-of select="identifier"/>
				</p>
			</td>
			<td>
				<p>
					<xsl:attribute name="id">
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
				
					<xsl:value-of select="name"/>
				</p>
			</td>
			<td>
				<p>
					<xsl:value-of select="description"/>
				</p>
			</td>
			<td>
				<p>
					<xsl:value-of select="type"/>
				</p>
			</td>
			<td>
				<xsl:apply-templates select="Domain"/>
			</td>
			<td>
				<xsl:apply-templates select="Physical"/>
			</td>
			<td>
				<p>
					<xsl:apply-templates select="Aspects" mode="GetAspectNumber"/>
				</p>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="IrreducibleCPS">
		<tr>
			<xsl:attribute name="id">
				<xsl:text>irreducible-cps</xsl:text>
			</xsl:attribute>
			
			<xsl:call-template name="CreateCpsContent"/>
		</tr>
	</xsl:template>
	
	<xsl:template match="cps">
		<tr>
			<xsl:attribute name="id">
				<xsl:text>cps</xsl:text>
			</xsl:attribute>
			
			<xsl:call-template name="CreateCpsContent"/>
		</tr>
	</xsl:template>
	
	<xsl:template name="CreateCpsContent">
		<td>
			<p>
				<xsl:attribute name="id">
					<xsl:value-of select="technicalId"/>
				</xsl:attribute>
				
				<xsl:value-of select="identifier"/>
			</p>
		</td>
		
		<td>
			<p>
				<xsl:value-of select="name"/>
			</p>
		</td>
		
		<td>
			<p>
				<xsl:value-of select="description"/>
			</p>
		</td>
		
		<td>
			<p>
				<xsl:value-of select="type"/>
			</p>
		</td>
		
		<td>
			<xsl:apply-templates select="Domain"/>
		</td>
		
		<td>
			<xsl:apply-templates select="Aspects" mode="GetAspectNumber"/>
		</td>
		
		<td>
			<xsl:apply-templates select="Logical"/>
		</td>
		
		<td>
			<xsl:apply-templates select="Physical"/>
		</td>	
	</xsl:template>
	
	<xsl:template match="Logical">
		<table>
			<xsl:if test="name">
				<tr>
					<th>Name</th>
					<th>
						<p>
							<xsl:attribute name="id">
								<xsl:value-of select="technicalId"/>
							</xsl:attribute>
						
							<xsl:value-of select="name"/>
						</p>
					</th>
				</tr>
			</xsl:if>
			<xsl:if test="identifier">
				<tr>
					<th>Identifier</th>
					<td>
						<p>
							<xsl:value-of select="identifier"/>
						</p>
					</td>
				</tr>
			</xsl:if>
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
			<xsl:if test="state">
				<tr>
					<th>State</th>
					<td>
						<p>
							<xsl:value-of select="state"/>
						</p>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="type">
				<tr>
					<th>Type</th>
					<td>
						<p>
							<xsl:value-of select="type"/>
						</p>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Ref_msgs">
				<tr>
					<th>Ref Msg</th>
					<td>
						<xsl:for-each select="Ref_msgs">
							<p>
								<xsl:value-of select="refMessage"/>
							</p>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Aspects">
				<tr>
					<th>Requirements R-ID</th>
					<td>
						<p>
							<xsl:apply-templates select="Aspects" mode="GetAspectNumber"/>
						</p>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	
	<xsl:template match="Physical">
		<table>
			<xsl:if test="name">
				<tr>
					<th>Name</th>
					<th>
						<p>
							<xsl:attribute name="id">
								<xsl:value-of select="technicalId"/>
							</xsl:attribute>
						
							<xsl:value-of select="name"/>
						</p>
					</th>
				</tr>
			</xsl:if>
			<xsl:if test="identifier">
				<tr>
					<th>Identifier</th>
					<td>
						<p>
							<xsl:value-of select="identifier"/>
						</p>
					</td>
				</tr>
			</xsl:if>
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
			<xsl:if test="state">
				<tr>
					<th>State</th>
					<td>
						<p>
							<xsl:value-of select="state"/>
						</p>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="type">
				<tr>
					<th>Type</th>
					<td>
						<p>
							<xsl:value-of select="type"/>
						</p>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Ref_Influences">
				<tr>
					<th>Ref Influence</th>
					<td>
						<xsl:for-each select="Ref_Influences">
							<p>
								<xsl:value-of select="refInfluence"/>
							</p>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="Aspects">
				<tr>
					<th>Requirements R-ID</th>
					<td>
						<p>
							<xsl:apply-templates select="Aspects" mode="GetAspectNumber"/>
						</p>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	
	<xsl:template match="Domain">
		<p>
			<xsl:attribute name="id">
				<xsl:value-of select="technicalId"/>
			</xsl:attribute>
		
			<xsl:value-of select="name"/>
			<xsl:text>: </xsl:text>
			<xsl:value-of select="description"/>
		</p>
	</xsl:template>
	
	<!--This template outputs information related to a BusinessCases.
		This includes the technicalId, identifier, name, description, type, and Domains.-->
	<xsl:template match="BusinessCase">
		<tr>
			<td>
				<p>
					<!--LOOKUP: BusinessCase/technicalId-->
					<xsl:attribute name="id">
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
					
					<!--LOOKUP: BusinessCase/identifier-->
					<xsl:value-of select="identifier"/>
				</p>
			</td>
			<td>
				
				<p>
					<!--LOOKUP: BusinessCase/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
			<td>
				<xsl:for-each select="Domain">
					<p>
						<!--LOOKUP: BusinessCase/Domain/technicalId-->
						<xsl:attribute name="id">
							<xsl:value-of select="technicalId"/>
						</xsl:attribute>
						
						<!--LOOKUP: BusinessCase/Domain/name-->
						<xsl:value-of select="name"/>
					</p>
				</xsl:for-each>
			</td>
			<td>
				<p>
					<!--LOOKUP: BusinessCase/Domain/description-->
					<xsl:value-of select="description"/>
				</p>
			</td>
			<td>
				<p>
					<!--Get requirement number from lookup table-->
					<xsl:apply-templates mode="GetAspectNumber" select="Aspects"/>
				</p>
			</td>
			<td>
				<xsl:if test="type">
					<p>
						<!--LOOKUP: BusinessCase/Domain/type-->
						<xsl:value-of select="type"/>
					</p>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	
	<!--This template outputs basic information related to the UseCase. 
		This includes the technicalId, identifier, and name.-->
	<xsl:template match="UseCase">
		<tr>
			<td>
				<p>
					<!--LOOKUP: UseCase/technicalId-->
					<xsl:attribute name="id">
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
					
					<!--LOOKUP: UseCase/Identifier-->
					<xsl:value-of select="identifier"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: UseCase/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
			<td>
				<xsl:if test="description">
					<p>
						<!--LOOKUP: UseCase/description-->
						<xsl:value-of select="description"/>
					</p>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	
	<!--This is a named template that outputs the scope and objectives for a UseCase.
		It is in a push configuration because the basic information template already consumes the UseCase once.-->
	<xsl:template name="ScopeAndObjectives">
		<xsl:for-each select="cps:CPSFramework/UseCase">
			<tr>
				<th>Related business case</th>
				<td>
					<!--LOOKUP: UseCase/BusinessCase/technicalId-->
					<xsl:for-each select="BusinessCase">
						<p>
							<xsl:value-of select="technicalId"/>
							<xsl:if test="position() &lt; last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</p>
					</xsl:for-each>
				</td>
			</tr>
			<tr>
				<th>Scope</th>
				<td>
					<p>
						<!--LOOKUP: UseCase/Scope-->
						<xsl:value-of select="scope"/>
					</p>
				</td>
			</tr>
			<tr>
				<th>Objective</th>
				<td>
					<xsl:for-each select="RelatedObjective">
						<p>
							<xsl:attribute name="id">
								<xsl:value-of select="technicalId"/>
							</xsl:attribute>
							<xsl:value-of select="concat(name,': ', description)"/>
						</p>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	
	<!--This template outputs Remarks with it's technicalId and content.-->
	<xsl:template match="Remark">
		<tr>
			<td>
				<p>
					<!--LOOKUP: UseCase/technicalId-->
					<xsl:attribute name="id">
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
					
					<!--LOOKUP: UseCase/Remark/content-->
					<xsl:value-of select="content"/>
				</p>
			</td>
		</tr>
	</xsl:template>
	
	<!--This template outputs Version informatoin. Multiple authors are joined by ', '.-->
	<xsl:template match="Version">
		<tr>
			<td>
				<xsl:if test="changes">
								<p>
						<!--LOOKUP: UseCase/Version/changes-->
						<xsl:value-of select="changes"/>
					</p>
				</xsl:if>
			</td>
			<td>
				<p>
					<!--LOOKUP: UseCase/Version/date-->
					<xsl:value-of select="date"/>
				</p>
			</td>
			<td>
				<xsl:if test="Author">
					<xsl:for-each select="Author">
						<p>
							<xsl:value-of select="name"/>
						</p>
					</xsl:for-each>
				</xsl:if>
			</td>
			<td>
				<xsl:if test="approvalStatus">
					<p>
						<!--LOOKUP: UseCase/Version/approvalStatus-->
						<xsl:value-of select="approvalStatus"/>
					</p>
				</xsl:if>
			</td>
			<td>
				<xsl:if test="versionNumber">
					<p>
						<!--LOOKUP: UseCase/Version/versionNumber-->
						<xsl:value-of select="versionNumber"/>
					</p>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	
	<!--This template adds a rows to the 1.4 table for any Narrative elements.-->
	<xsl:template match="Narrative">
		<tr>
			<th>Short description - max 3 sentences</th>
		</tr>
		<tr>
			<td>
				<p>
					<!--LOOKUP: UseCase/Narrative/shortDescription-->
					<xsl:value-of select="shortDescription"/>
				</p>
			</td>
		</tr>
		<tr>
			<th>Complete description</th>
		</tr>				
		<tr>
			<td>
				<p>
					<!--LOOKUP: UseCase/Narrative/completeDescription-->
					<xsl:value-of select="completeDescription"/>
				</p>
			</td>
		</tr>
	</xsl:template>

	<!--Create table for basic CPSGrouping and call template for any CPS elements.-->
	<xsl:template match="CPSGrouping">
		<table id="3.1">
			<tr>
				<th colspan="4">Actors</th>
			</tr>
			<tr>
				<th colspan="2">Grouping (Community)</th>
				<th colspan="2">Group Description</th>
			</tr>
			<tr>
				<td colspan="2">
					<xsl:if test="identifier">
						<p>
							<!--LOOKUP: UseCase/CPSGrouping/identifier-->
							<xsl:attribute name="id">
								<xsl:value-of select="identifier"/>
							</xsl:attribute>
						
							<!--LOOKUP: UseCase/CPSGrouping/name-->
							<xsl:value-of select="name"/>
						</p>
					</xsl:if>
				</td>
				<td colspan="2">
					<xsl:if test="description">
						<p>
							<!--LOOKUP: UseCase/CPSGrouping/description-->
							<xsl:value-of select="description"/>
						</p>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<th>Actor Name see Actor  List</th>
				<th>Actor Type see Actor  List</th>
				<th>Further information specific to this Use Case</th>
			</tr>
			
			<xsl:apply-templates select="CPS"/>

		</table>
	</xsl:template>
	
	<!--Output information for CPS element-->
	<xsl:template match="CPS">
		<tr>
			<td>
				<p>
					<!--LOOKUP: CPSGrouping/CPS/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: CPSGrouping/CPS/technicalId-->
					<xsl:value-of select="technicalId"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: CPSGrouping/CPS/furtherInformation-->
					<xsl:value-of select="furtherInformation"/>
				</p>
			</td>
		</tr>
	</xsl:template>
	
	<!--Output UseCase Precondition and Assumption elements.-->
	<xsl:template match="Prerequisite">
		<tr>
			<td>
				<p>
					<!--LOOKUP: Prerequisite/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
			
			<td>
				<p>
					<!--LOOKUP: Prerequisite/content-->
					<xsl:value-of select="content"/>	
				</p>
			</td>
		</tr>
	</xsl:template>
	
	<!--Outputs an assumption table row.-->
	<xsl:template match="Assumption">
		<tr>
			<td>
				<p>
					<!--LOOKUP: Assumption/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
			
			<td>
				<p>
					<!--LOOKUP: Assumption/content-->
					<xsl:value-of select="content"/>	
				</p>
			</td>
		</tr>
	</xsl:template>
	
	<!--Output UseCase Reference element.-->
	<xsl:template match="Reference">
		<tr>
			<td>
				<p>
					<!--LOOKUP: UseCase/technicalId-->
					<xsl:attribute name="id">
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
					
					<!--LOOKUP: UseCase/Reference/identifier-->
					<xsl:value-of select="identifier"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: UseCase/Reference/type-->
					<xsl:value-of select="type"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: UseCase/Reference/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: UseCase/Reference/description-->
					<xsl:value-of select="description"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: UseCase/Reference/status-->
					<xsl:value-of select="status"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: UseCase/Reference/impact-->
					<xsl:value-of select="impact"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: UseCase/Reference/orginiatorOrganisation-->
					<xsl:value-of select="originatorOrganisation"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: UseCase/Reference/link-->
					<xsl:value-of select="link"/>
				</p>
			</td>
		</tr>
	</xsl:template>

	<!--Ouptut additional UseCase information such as RelatedUseCase, levelOfdepth, classification, etc.-->
	<xsl:template name="FurtherInformation">
		<xsl:for-each select="cps:CPSFramework/UseCase">
			<tr>
				<td>
					<!--LOOKUP: UseCase/technicalId-->
					<xsl:attribute name="id">
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
					
					<xsl:for-each select="RelatedUseCase">
						<p>
							<!--LOOKUP: UseCase/RelatedUseCase/technicalId-->
							<xsl:attribute name="id">
								<xsl:value-of select="technicalId"/>
							</xsl:attribute>
					
							<!--LOOKUP: UseCase/RelatedUseCase/name-->
							<!--<xsl:value-of select="if (position() = last()) then name else concat(name, ',')"/>-->
							<xsl:value-of select="name"/>
							<xsl:if test="position() &lt; last()">
								<xsl:text>,</xsl:text>
							</xsl:if>
						</p>
					</xsl:for-each>
				</td>
				<td>
					<p>
						<!--LOOKUP: UseCase/levelOfDepth-->
						<xsl:value-of select="levelOfDepth"/>
					</p>
				</td>
				<td>
					<p>
						<!--LOOKUP: UseCase/prioritisation-->
						<xsl:value-of select="prioritisation"/>
					</p>
				</td>
				<td>
					<p>
						<!--LOOKUP: UseCase/classification-->
						<xsl:value-of select="classification"/>
					</p>
				</td>
				<td>
					<p>
						<!--LOOKUP: UseCase/nature-->
						<xsl:value-of select="nature"/>
					</p>
				</td>
				<td>
					<p>
						<!--LOOKUP: UseCase/keywords-->
						<xsl:value-of select="keywords"/>
					</p>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>

	<!--Output header table for a Scenario. This includes basic information about the Scenario and
		then creates sub tables for the MacroActivities and steps in this Scenario.-->
	<xsl:template match="Scenario" mode="ScenarioTable">
		<tr>
			<td>
				<p>
					<!--LOOKUP: UseCase/Scenario/technicalId-->
					<xsl:attribute name="id">
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
					
					<!--LOOKUP: UseCase/Scenario/identifier-->
					<xsl:value-of select="identifier"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: UseCase/Scenario/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
			<td>
				<xsl:if test="description">
					<p>
						<!--LOOKUP: UseCase/Scenario/description-->
						<xsl:value-of select="description"/>
					</p>
				</xsl:if>
			</td>
			<td>
				<!--LOOKUP: UseCase/Scenario/PrimaryCPS-->
				<xsl:for-each select="PrimaryCPS">
					<p>
						<!--LOOKUP: PrimaryCPS/technicalId-->
						<xsl:attribute name="id">
							<xsl:value-of select="technicalId"/>
						</xsl:attribute>
						
						<!--LOOKUP: PrimaryCPS/name-->
						<xsl:value-of select="name"/>
					</p>
				</xsl:for-each>
			</td>
			<td>
				<!--LOOKUP: UseCase/Scenario/TriggeringEvent-->
				<xsl:for-each select="TriggeringEvent">
					<p>
						<!--LOOKUP: TriggeringEvent/name & TriggeringEvent/content-->
						<xsl:value-of select="concat(name, ': ', content)"/>
					</p>
				</xsl:for-each>
			</td>
			<td>
				<!--LOOKUP: UseCase/Scenario/Precondition-->
				<xsl:for-each select="Precondition">
					<p>
						<!--LOOKUP: Precondition/name & Precondition/description-->
						<xsl:value-of select="concat(name, ': ', content)"/>
					</p>
				</xsl:for-each>
			</td>
			<td>
				<!--LOOKUP: UseCase/Scenario/Postcondition-->
				<xsl:for-each select="Postcondition">
					<p>
						<!--LOOKUP: Postcondition/name & Postcondition/description-->
						<xsl:value-of select="concat(name, ': ', content)"/>
					</p>
				</xsl:for-each>
			</td>
			<td>
				<p>
					<xsl:apply-templates mode="GetAspectNumber" select="Aspects"/>
				</p>
			</td>
		</tr>
	</xsl:template>
	
	<!--Outputs a table for all the steps in a Scenario.-->
	<xsl:template match="Scenario" mode="ScenarioStepsTable">
		<h2>
			<p>
				<!--LOOKUP: Scenario/technicalId-->
				<xsl:attribute name="id">
					<xsl:value-of select="technicalId"/>
				</xsl:attribute>
			
				<!--LOOKUP: Scenario/name-->
				<xsl:text>Steps - </xsl:text>
				<xsl:value-of select="name"/>
			</p>
		</h2>
		
		<div id="ScenarioTables">
			<table id="4.1.1">
				<tr>
					<th scope="col" colspan="2">Scenario</th>
				</tr>
				<tr>
					<th scope="row">Scenario Name:</th>
					<td>
						<p>
							<!--LOOKUP: Scenario/name-->
							<xsl:value-of select="name"/>
						</p>
					</td>
				</tr>
			</table>			
				
			<xsl:apply-templates select="MacroActivity"/>
		</div>
		
		<xsl:call-template name="GenerateAspectsTable">
			<xsl:with-param name="id" select="'4.1.1'"/>
			<xsl:with-param name="aspectNodes" select=".//Aspects"/>
		</xsl:call-template>

	</xsl:template>
	
	<!--Ouptut sub tables for a MacroActivity.-->
	<xsl:template match="MacroActivity">
		<table id="4.1.2">
			<tr id="MacroActivity">
				<th scope="row" colspan="2">
					<p>
						<xsl:attribute name="id">
							<!--LOOKUP: MacroActivity/technicald-->
							<xsl:value-of select="technicalId"/>
						</xsl:attribute>
					
						<!--LOOKUP: Macroactivity/name-->
						<xsl:value-of select="name"/>
					</p>
				</th>
				<td colspan="10">
					<xsl:if test="description">
						<p>
							<!--LOOKUP: Macroactivity/description-->
							<xsl:value-of select="description"/>
						</p>
					</xsl:if>
				</td>
			</tr>
			
			<tr>
				<th  colspan="12">Drawings</th>
			</tr>
			
			<tr>
				<td colspan="12">
					<xsl:apply-templates select="Drawing"/>
				</td>
			</tr>
			
			<tr>
				<th colspan="12">PrimaryCPS</th>
			</tr>
			
			<tr>
				<td colspan="12">
					<xsl:for-each select="PrimaryCPS">
						<p>
							<xsl:attribute name="id">
								<xsl:value-of select="technicalId"/>
							</xsl:attribute>
							
							<xsl:value-of select="name"/>
						</p>
					</xsl:for-each>
				</td>
			</tr>
			
			<tr>
				<th colspan="12">Requirement</th>
			</tr>
			
			<tr>
				<td colspan="12">
					<xsl:for-each select="Requirement">
						<p>
							<xsl:value-of select="technicalId"/>
						</p>
					</xsl:for-each>
				</td>
			</tr>
			
			<tr>
				<th>Step No.</th>
				<th>Event</th>
				<th>Name of Process/ Activity</th>
				<th>Description of Process/ Activity</th>
				<th>Service</th>
				<th>Information Producer (Actor)</th>
				<th>Information Receiver (Actor)</th>
				<th>Information Exchanged</th>
				<th>Interaction</th>
				<th>Ref Requirements</th>
				<th>Requirements , R-ID</th>
				<th>Drawing</th>
			</tr>
			
			<xsl:apply-templates select="Step"/>
		</table>
	</xsl:template>
	
	<!--Output table for a Step-->
	<xsl:template match="Step">
		<tr>
			<td>
				<p>
					<xsl:attribute name="id">
						<!--LOOKUP: Step/technicalId-->
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
				
					<!--LOOKUP: Step/identifier-->
					<xsl:value-of select="identifier"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: Step/event-->
					<xsl:value-of select="event"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: Step/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: Step/description-->
					<xsl:value-of select="description"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: Step/service-->
					<xsl:value-of select="service"/>
				</p>
			</td>
			<td>
				<xsl:for-each select="InformationProducer">
					<p>
						<!--LOOKUP: Step/InformationProducer/technicalId-->
						<xsl:attribute name="id">
							<xsl:value-of select="technicalId"/>
						</xsl:attribute>
						
						<!--LOOKUP: Step/InformationProducer/name-->
						<xsl:value-of select="name"/>
					</p>
				</xsl:for-each>
			</td>
			<td>
				<xsl:for-each select="InformationReceiver">
					<p>
						<!--LOOKUP: Step/InformationReceiver/technicalId-->
						<xsl:attribute name="id">
							<xsl:value-of select="technicalId"/>
						</xsl:attribute>
						
						<!--LOOKUP: Step/InformationReceiver/name-->
						<xsl:value-of select="name"/>
					</p>
				</xsl:for-each>
			</td>
			<td>
				<xsl:for-each select="BusinessObject">
					<p>
						<!--LOOKUP: Step/BusinessObject/technicalId-->
						<xsl:attribute name="id">
							<xsl:value-of select="technicalId"/>
						</xsl:attribute>
						
						<!--LOOKUP: Step/BusinessObject/name-->
						<xsl:value-of select="name"/>
					</p>
				</xsl:for-each>
			</td>
			<td>
				<p>
					<!--LOOKUP: Step/interaction/refMessage-->
					<xsl:value-of select="interaction/refMessage"/>
				</p>
			</td>
			<td>
				<xsl:for-each select="Requirement/technicalId">
					<p>
						<xsl:value-of select="."/>
					</p>
				</xsl:for-each>
			</td>
			<td>
				<p>
					<xsl:apply-templates mode="GetAspectNumber" select="Aspects"/>
				</p>
			</td>
			<td>
				<xsl:apply-templates select="Drawing"/>
			</td>
		</tr>
	</xsl:template>

	<!--Output InformationModel information.-->
	<xsl:template match="InformationModel">
		<tr>
			<td>
				<p>
					<!--LOOKUP: InformationModel/technicalId-->
					<xsl:attribute name="id">
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
				
					<!--LOOKUP: InformationModel/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: InformationModel/description-->
					<xsl:value-of select="description"/>
				</p>
			</td>
			<td>
				<xsl:for-each select="Requirement">
					<p>
						<!--LOOKUP: InformationModel/Requirement-->
						<xsl:value-of select="technicalId"/>
						
						<xsl:if test="position() &lt; last()">
							<xsl:text>,</xsl:text>
						</xsl:if>
					</p>
				</xsl:for-each>
			</td>
			<td>
				<p>
					<xsl:apply-templates mode="GetAspectNumber" select="Aspects"/>
				</p>
			</td>
		</tr>
	</xsl:template>
	
	<!--Creates a table for a Maturity element. This will output all the information in a table row.-->
	<xsl:template match="Maturity">
		<tr>
			<th>Effective</th>
			<th>Maturity</th>
			<th>Responsible Party</th>
			<th>Revision</th>
			<th>Status</th>
		</tr>
		<tr>
			<td>
				<p>
					<!--LOOKUP: Maturity/effective-->
					<xsl:value-of select="effective"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: Maturity/maurity-->
					<xsl:value-of select="maturity"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: Maturity/responsibleParty-->
					<xsl:value-of select="responsibleParty"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: Maturity/revision-->
					<xsl:value-of select="revision"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: Maturity/status-->
					<xsl:value-of select="status"/>
				</p>
			</td>
		</tr>
	</xsl:template>

	<!--Outputs influence table row.-->
	<xsl:template match="influence">
		<tr>
			<td>
				<p>
					<!--LOOKUP: influence/technicalId-->
					<xsl:attribute name="id">
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
					
					<!--LOOKUP: influence/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: influence/description-->
					<xsl:value-of select="description"/>
				</p>
			</td>
			<td>
				<p>
					<xsl:apply-templates mode="GetAspectNumber" select="Aspects"/>
				</p>
			</td>
		</tr>
	</xsl:template>
	
	<!--Outputs message table row.-->
	<xsl:template match="message">
		<tr>
			<td>
				<p>
					<!--LOOKUP: message/technicalId-->
					<xsl:attribute name="id">
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
					
					<!--LOOKUP: message/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: message/description-->
					<xsl:value-of select="description"/>
				</p>
			</td>
			<td>
				<p>
					<xsl:apply-templates mode="GetAspectNumber" select="Aspects"/>
				</p>
			</td>
		</tr>
	</xsl:template>

	<!--Outputs a Drawing as an html img element. Images will be placed on their own lines
		use a p element.-->
	<xsl:template match="Drawing">
		<p>
			<xsl:attribute name="id">
				<xsl:value-of select="drawingType"/>
			</xsl:attribute>
			<xsl:element name="img">
				<xsl:attribute name="id">
					<xsl:value-of select="URI/@type"/>
				</xsl:attribute>
				<xsl:attribute name="width">
					<xsl:value-of select="substring-before(substring-after(URI,'W'),'_')"/>
				</xsl:attribute>
				<xsl:attribute name="height">
					<xsl:value-of select="substring-before(substring-after(URI,'H'),'_')"/>
					</xsl:attribute>
				<xsl:attribute name="src">
					<xsl:value-of select="URI"/>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="name"/>
				</xsl:attribute>
			</xsl:element>
		</p>
	</xsl:template>
</xsl:stylesheet>
