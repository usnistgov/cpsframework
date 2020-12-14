<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	 
	<!--Joins the values in the given node set into one string with the given joinString in between.
	Default JoinString is a space.-->
	<xsl:template name="StringJoin">
		<xsl:param name="values"/>
		<xsl:param name="joinString" select="' '"/>
		<xsl:for-each select="$values">
			<xsl:value-of select="."/>
			<xsl:if test="position() &lt; last()">
				<xsl:value-of select="$joinString"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
