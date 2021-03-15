<?xml version="1.0" encoding="UTF-8"?><!--Created June, 2020--><xsl:stylesheet version="1.0" 	xmlns:cps="cpsframework"	xmlns:x="http://www.w3.org/1999/xhtml"	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 	xmlns:msxsl="urn:schemas-microsoft-com:xslt"	xmlns:xs="http://www.w3.org/2001/XMLSchema"	exclude-result-prefixes="xsi x cps msxsl" >		<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>	<xsl:template match="/">		<xsl:processing-instruction name="xml-stylesheet">type="text/xsl" href="CPSFrameworkXMLToDOC.xsl"</xsl:processing-instruction>			<cps:CPSFramework>			<xsl:apply-templates select="x:html/x:body/x:table[@id='0']" mode="ExtractBusinessCase"/>						<CPSLibrary>				<xsl:apply-templates select="x:html/x:body/x:table[@id='7.1']/x:tr[@id='cps']" mode="ExtractCps"/>								<xsl:apply-templates select="x:html/x:body/x:table[@id='7.2']/x:tr[@id='system']" mode="ExtractSystem"/>								<xsl:apply-templates select="x:html/x:body/x:table[@id='7.3']/x:tr[position() > 1]" mode="ExtractSystemOfSystems"/>								<xsl:apply-templates select="x:html/x:body/x:table[@id='7.4']" mode="ExtractMaturity"/>			</CPSLibrary>						<xsl:apply-templates select="x:html/x:body/x:table[@id='5.0.1']" mode="ExtractInformationModelLibrary"/>						<xsl:apply-templates select="x:html/x:body" mode="ExtractInteractionLibrary"/>						<xsl:apply-templates select="x:html/x:body/x:table[@id='1.2.1']" mode="ExtractMaturity"/>						<xsl:apply-templates select="x:html/x:body" mode="ExtractUseCase"/>		</cps:CPSFramework>	</xsl:template>		<xsl:template match="x:tr" mode="ExtractSystemOfSystems">		<systemofsystems>			<xsl:if test="x:td[3]/x:p[text() != '']">				<description>					<xsl:value-of select="x:td[3]/x:p"/>				</description>			</xsl:if>						<identifier>				<xsl:value-of select="x:td[1]/x:p"/>			</identifier>						<name>				<xsl:value-of select="x:td[2]/x:p"/>			</name>						<technicalId>				<xsl:value-of select="x:td[1]/x:p/@id"/>			</technicalId>						<xsl:if test="x:td[4]/x:p[text() != '']">				<type>					<xsl:value-of select="x:td[4]/x:p"/>				</type>			</xsl:if>						<xsl:variable name="RequirementNumber">				<xsl:value-of select="x:td[7]/x:p"/>			</xsl:variable>						<xsl:variable name="tempAspectLookup">				<xsl:apply-templates select="../../x:table[@id='7.0.1']" mode="GenerateAspectsLookupTable"/>			</xsl:variable>			<xsl:variable name="AspectsLookup" select="msxsl:node-set($tempAspectLookup)"/>			 			<xsl:copy-of select="$AspectsLookup/entry[@number=$RequirementNumber]/Aspects"/>						<xsl:if test="x:td[5]/x:p">				<xsl:apply-templates select="x:td[5]/x:p" mode="ExtractCpsDomain"/>			</xsl:if>									<xsl:for-each select="x:td[6]/x:p">				<xsl:variable name="systemIdentifier" select="."/>							<xsl:apply-templates 					select="../../../../x:table[@id='7.2']/x:tr[@id='system-of-systems' and x:td[1]/x:p[text() = $systemIdentifier]]" 					mode="ExtractCapitalSystem"/>			</xsl:for-each>					</systemofsystems>	</xsl:template>		<xsl:template match="x:tr" mode="ExtractCapitalSystem">		<System>			<xsl:apply-templates select="." mode="ExtractSystemContent"/>		</System>	</xsl:template>			<xsl:template match="x:tr" mode="ExtractSystem">		<system>			<xsl:apply-templates select="." mode="ExtractSystemContent"/>		</system>	</xsl:template>		<xsl:template match="x:tr" mode="ExtractSystemContent">		<xsl:if test="x:td[3]/x:p[text() != '']">			<description>				<xsl:value-of select="x:td[3]/x:p"/>			</description>		</xsl:if>				<identifier>			<xsl:value-of select="x:td[1]/x:p"/>		</identifier>				<name>			<xsl:value-of select="x:td[2]/x:p"/>		</name>				<technicalId>			<xsl:value-of select="x:td[1]/x:p/@id"/>		</technicalId>				<xsl:if test="x:td[4]/x:p[text() != '']">			<type>				<xsl:value-of select="x:td[4]/x:p"/>			</type>		</xsl:if>				<xsl:variable name="RequirementNumber">			<xsl:value-of select="x:td[5]/x:p"/>		</xsl:variable>				<xsl:variable name="tempAspectLookup">			<xsl:apply-templates select="../../x:table[@id='7.0.1']" mode="GenerateAspectsLookupTable"/>		</xsl:variable>		<xsl:variable name="AspectsLookup" select="msxsl:node-set($tempAspectLookup)"/>		 		<xsl:copy-of select="$AspectsLookup/entry[@number=$RequirementNumber]/Aspects"/>				<xsl:if test="x:td[6]/x:p">			<xsl:apply-templates select="x:td[6]/x:p" mode="ExtractCpsDomain"/>		</xsl:if>				<xsl:for-each select="x:td[7]/x:p">			<xsl:variable name="humanIdentifier" select="."/>					<xsl:apply-templates 			select="../../../../x:table[@id='7.2.1']/x:tr[x:td[1]/x:p[text() = $humanIdentifier]]" 			mode="ExtractHuman"/>		</xsl:for-each>				<xsl:for-each select="x:td[8]/x:p">			<xsl:variable name="cpsIdentifier" select="."/>					<xsl:apply-templates 				select="../../../../x:table[@id='7.1']/x:tr[@id='irreducible-cps' and x:td[1]/x:p[text() = $cpsIdentifier]]" 				mode="ExtractIrreducibleCps"/>		</xsl:for-each>	</xsl:template>		<xsl:template match="x:tr" mode="ExtractHuman">		<Human>			<xsl:if test="x:td[3]/x:p[text() != '']">				<description>					<xsl:value-of select="x:td[3]/x:p"/>				</description>			</xsl:if>						<identifier>				<xsl:value-of select="x:td[1]/x:p"/>			</identifier>						<name>				<xsl:value-of select="x:td[2]/x:p"/>			</name>						<technicalId>				<xsl:value-of select="x:td[2]/x:p/@id"/>			</technicalId>						<xsl:if test="x:td[4]/x:p[text() != '']">				<type>					<xsl:value-of select="x:td[4]/x:p"/>				</type>			</xsl:if>						<xsl:variable name="RequirementNumber">				<xsl:value-of select="x:td[7]"/>			</xsl:variable>						<xsl:variable name="tempAspectLookup">				<xsl:apply-templates select="../../x:table[@id='7.0.1']" mode="GenerateAspectsLookupTable"/>			</xsl:variable>			<xsl:variable name="AspectsLookup" select="msxsl:node-set($tempAspectLookup)"/>			 			<xsl:copy-of select="$AspectsLookup/entry[@number=$RequirementNumber]/Aspects"/>						<xsl:if test="x:td[5]/x:p">				<xsl:apply-templates select="x:td[5]/x:p" mode="ExtractCpsDomain"/>			</xsl:if>						<xsl:apply-templates select="x:td[6]/x:table" mode="ExtractPhysical"/>		</Human>	</xsl:template>		<xsl:template match="x:tr" mode="ExtractCps">		<cps>			<xsl:apply-templates select="." mode="ExtractCpsContent"/>		</cps>	</xsl:template>		<xsl:template match="x:tr" mode="ExtractIrreducibleCps">		<IrreducibleCPS>			<xsl:apply-templates select="." mode="ExtractCpsContent"/>		</IrreducibleCPS>	</xsl:template>		<xsl:template match="x:tr" mode="ExtractCpsContent">		<xsl:if test="x:td[3]/x:p[text() != '']">			<description>				<xsl:value-of select="x:td[3]/x:p"/>			</description>		</xsl:if>				<identifier>			<xsl:value-of select="x:td[1]/x:p"/>		</identifier>				<name>			<xsl:value-of select="x:td[2]/x:p"/>		</name>				<technicalId>			<xsl:value-of select="x:td[1]/x:p/@id"/>		</technicalId>				<xsl:if test="x:td[4]/x:p[text() != '']">			<type>				<xsl:value-of select="x:td[4]/x:p"/>			</type>		</xsl:if>				<xsl:variable name="RequirementNumber">			<xsl:value-of select="x:td[6]"/>		</xsl:variable>				<xsl:variable name="tempAspectLookup">			<xsl:apply-templates select="../../x:table[@id='7.0.1']" mode="GenerateAspectsLookupTable"/>		</xsl:variable>		<xsl:variable name="AspectsLookup" select="msxsl:node-set($tempAspectLookup)"/>		 		<xsl:copy-of select="$AspectsLookup/entry[@number=$RequirementNumber]/Aspects"/>				<xsl:if test="x:td[5]/x:p">			<xsl:apply-templates select="x:td[5]/x:p" mode="ExtractCpsDomain"/>		</xsl:if>				<xsl:apply-templates select="x:td[7]/x:table" mode="ExtractLogical"/>				<xsl:apply-templates select="x:td[8]/x:table" mode="ExtractPhysical"/>	</xsl:template>		<xsl:template match="x:table" mode="ExtractPhysical">		<Physical>			<xsl:if test="x:tr[x:th[text() = 'Description']]">				<description>					<xsl:value-of select="x:tr[x:th[text() = 'Description']]/x:td/x:p"/>				</description>			</xsl:if>						<identifier>				<xsl:value-of select="x:tr[x:th[text() = 'Identifier']]/x:td/x:p"/>			</identifier>						<name>				<xsl:value-of select="x:tr[x:th[text() = 'Name']]/x:th[2]/x:p"/>			</name>						<technicalId>				<xsl:value-of select="x:tr[x:th[text() = 'Name']]/x:th[2]/x:p/@id"/>			</technicalId>						<xsl:if test="x:tr[x:th[text() = 'Type']]">				<type>					<xsl:value-of select="x:tr[x:th[text() = 'Type']]/x:td/x:p"/>				</type>			</xsl:if>			<xsl:variable name="RequirementNumber">				<xsl:value-of select="x:tr[x:th[text() = 'Requirements R-ID']]/x:td/x:p"/>			</xsl:variable>						<xsl:variable name="tempAspectLookup">				<xsl:apply-templates select="../../../x:table[@id='7.0.1']" mode="GenerateAspectsLookupTable"/>			</xsl:variable>			<xsl:variable name="AspectsLookup" select="msxsl:node-set($tempAspectLookup)"/>			 			<xsl:copy-of select="$AspectsLookup/entry[@number=$RequirementNumber]/Aspects"/>									<xsl:apply-templates select="x:tr[x:th[text() = 'Ref Influence']]/x:td/x:p" mode="ExtractRefInfluence"/>						<state>				<xsl:value-of select="x:tr[x:th[text() = 'State']]/x:td/x:p"/>			</state>		</Physical>	</xsl:template>			<xsl:template match="x:p" mode="ExtractRefInfluence">		<Ref_Influences>			<refInfluence>				<xsl:value-of select="."/>			</refInfluence>		</Ref_Influences>	</xsl:template>		<xsl:template match="x:table" mode="ExtractLogical">		<Logical>			<xsl:if test="x:tr[x:th[text() = 'Description']]">				<description>					<xsl:value-of select="x:tr[x:th[text() = 'Description']]/x:td/x:p"/>				</description>			</xsl:if>						<identifier>				<xsl:value-of select="x:tr[x:th[text() = 'Identifier']]/x:td/x:p"/>			</identifier>						<name>				<xsl:value-of select="x:tr[x:th[text() = 'Name']]/x:th[2]/x:p"/>			</name>						<technicalId>				<xsl:value-of select="x:tr[x:th[text() = 'Name']]/x:th[2]/x:p/@id"/>			</technicalId>						<xsl:if test="x:tr[x:th[text() = 'Type']]">				<type>					<xsl:value-of select="x:tr[x:th[text() = 'Type']]/x:td/x:p"/>				</type>			</xsl:if>						<xsl:variable name="RequirementNumber">				<xsl:value-of select="x:tr[x:th[text() = 'Requirements R-ID']]/x:td/x:p"/>			</xsl:variable>						<xsl:variable name="tempAspectLookup">				<xsl:apply-templates select="../../../../x:table[@id='7.0.1']" mode="GenerateAspectsLookupTable"/>			</xsl:variable>			<xsl:variable name="AspectsLookup" select="msxsl:node-set($tempAspectLookup)"/>			 			<xsl:copy-of select="$AspectsLookup/entry[@number=$RequirementNumber]/Aspects"/>									<xsl:apply-templates select="x:tr[x:th[text() = 'Ref Msg']]/x:td/x:p" mode="ExtractRefMsg"/>						<state>				<xsl:value-of select="x:tr[x:th[text() = 'State']]/x:td/x:p"/>			</state>		</Logical>	</xsl:template>		<xsl:template match="x:p" mode="ExtractRefMsg">		<Ref_msgs>			<refMessage>				<xsl:value-of select="."/>			</refMessage>		</Ref_msgs>	</xsl:template>		<xsl:template match="x:p" mode="ExtractCpsDomain">		<Domain>			<xsl:if test="substring-after(., ': ')">				<description>					<xsl:value-of select="substring-after(., ': ')"/>				</description>			</xsl:if>						<name>				<xsl:value-of select="substring-before(., ': ')"/>			</name>						<technicalId>				<xsl:value-of select="@id"/>			</technicalId>		</Domain>	</xsl:template>		<xsl:template match="x:table" mode="ExtractBusinessCase">		<BusinessCase>			<description>				<xsl:value-of select="x:tr[2]/x:td[4]/x:p"/>			</description>			<identifier>				<xsl:value-of select="x:tr[2]/x:td[1]/x:p"/>			</identifier>			<name>				<xsl:value-of select="x:tr[2]/x:td[2]/x:p"/>			</name>			<technicalId>				<xsl:value-of select="x:tr[2]/x:td[1]/x:p/@id"/>			</technicalId>			<xsl:if test="x:tr[2]/x:td[6]/x:p">				<type>					<xsl:value-of select="x:tr[2]/x:td[6]/x:p"/>				</type>			</xsl:if>						<xsl:variable name="RequirementNumber">				<xsl:value-of select="x:tr[2]/x:td[5]/x:p"/>			</xsl:variable>						<xsl:variable name="tempAspectLookup">				<xsl:apply-templates select="../x:table[@id='0.1']" mode="GenerateAspectsLookupTable"/>			</xsl:variable>			<xsl:variable name="AspectsLookup" select="msxsl:node-set($tempAspectLookup)"/>			 			<xsl:copy-of select="$AspectsLookup/entry[@number=$RequirementNumber]/Aspects"/>						<xsl:apply-templates select="x:tr[2]/x:td[3]/x:p" mode="ExtractBusinessCaseDomains"/>					</BusinessCase>	</xsl:template>		<xsl:template match="x:p" mode="ExtractBusinessCaseDomains">		<Domain>			<xsl:apply-templates select="." mode="ExtractNameAndTechnicalIdFromP"/>		</Domain> 	</xsl:template>		<xsl:template match="x:table" mode="ExtractInformationModelLibrary">		<InformationModelLibrary>			<xsl:apply-templates select="x:tr[position() > 2]" mode="ExtractInformationModel"/>						<xsl:apply-templates select="../x:table[@id='5']" mode="ExtractMaturity"/>		</InformationModelLibrary>	</xsl:template>		<xsl:template match="x:tr" mode="ExtractInformationModel">		<InformationModel>			<description>				<xsl:value-of select="x:td[2]/x:p"/>			</description>			<name>				<xsl:value-of select="x:td[1]/x:p"/>			</name>						<xsl:apply-templates select="x:td[3]/x:p" mode="ExtractRequirement"/>						<technicalId>				<xsl:value-of select="x:td[1]/x:p/@id"/>			</technicalId>						<xsl:variable name="RequirementNumber">				<xsl:value-of select="x:td[4]/x:p"/>			</xsl:variable>						<xsl:variable name="tempAspectLookup">				<xsl:apply-templates select="../../x:table[@id='5.0.2']" mode="GenerateAspectsLookupTable"/>			</xsl:variable>			<xsl:variable name="AspectsLookup" select="msxsl:node-set($tempAspectLookup)"/>			 			<xsl:copy-of select="$AspectsLookup/entry[@number=$RequirementNumber]/Aspects"/>		</InformationModel>	</xsl:template>		<xsl:template match="x:p" mode="ExtractRequirement">		<Requirement>			<technicalId>				<xsl:choose>					<xsl:when test="substring-before(., ',')">						<xsl:value-of select="substring-before(., ',')"/>					</xsl:when>					<xsl:otherwise>						<xsl:value-of select="."/>					</xsl:otherwise>				</xsl:choose>			</technicalId>		</Requirement>	</xsl:template>		<xsl:template match="x:table" mode="ExtractMaturity">		<xsl:if test="x:tr[position() > 2]">			<Maturity>				<effective>					<xsl:value-of select="x:tr[3]/x:td[1]/x:p"/>				</effective>				<maturity>					<xsl:value-of select="x:tr[3]/x:td[2]/x:p"/>				</maturity>				<responsibleParty>					<xsl:value-of select="x:tr[3]/x:td[3]/x:p"/>				</responsibleParty>				<revision>					<xsl:value-of select="x:tr[3]/x:td[4]/x:p"/>				</revision>				<status>					<xsl:value-of select="x:tr[3]/x:td[5]/x:p"/>				</status>			</Maturity>		</xsl:if>	</xsl:template>		<xsl:template match="x:body" mode="ExtractInteractionLibrary">		<InteractionLibrary>			<xsl:apply-templates select="x:table[@id='6.2']" mode="ExtractInfluences"/>						<xsl:apply-templates select="x:table[@id='6.1']" mode="ExtractMaturity"/>						<xsl:apply-templates select="x:table[@id='6.3']" mode="ExtractMessages"/>		</InteractionLibrary>	</xsl:template>		<xsl:template match="x:table" mode="ExtractInfluences">		<xsl:if test="x:tr[position() > 2]">			<Influences>				<xsl:for-each select="x:tr[position() > 2]">					<influence>						<description>							<xsl:value-of select="x:td[2]/x:p"/>						</description>												<xsl:apply-templates select="x:td[1]/x:p" mode="ExtractNameAndTechnicalIdFromP"/>												<xsl:variable name="RequirementNumber">							<xsl:value-of select="x:td[3]/x:p"/>						</xsl:variable>												<xsl:variable name="tempAspectLookup">							<xsl:apply-templates select="../../x:table[@id='6.2.1']" mode="GenerateAspectsLookupTable"/>						</xsl:variable>						<xsl:variable name="AspectsLookup" select="msxsl:node-set($tempAspectLookup)"/>						 						<xsl:copy-of select="$AspectsLookup/entry[@number=$RequirementNumber]/Aspects"/>					</influence>				</xsl:for-each>			</Influences>		</xsl:if>	</xsl:template>		<xsl:template match="x:table" mode="ExtractMessages">		<Messages>			<xsl:for-each select="x:tr[position() > 2]">				<message>					<description>						<xsl:value-of select="x:td[2]/x:p"/>					</description>					<xsl:apply-templates select="x:td[1]/x:p" mode="ExtractNameAndTechnicalIdFromP"/>										<xsl:variable name="RequirementNumber">						<xsl:value-of select="x:td[3]/x:p"/>					</xsl:variable>										<xsl:variable name="tempAspectLookup">						<xsl:apply-templates select="../../x:table[@id='6.3.1']" mode="GenerateAspectsLookupTable"/>					</xsl:variable>					<xsl:variable name="AspectsLookup" select="msxsl:node-set($tempAspectLookup)"/>					 					<xsl:copy-of select="$AspectsLookup/entry[@number=$RequirementNumber]/Aspects"/>				</message>			</xsl:for-each>		</Messages>	</xsl:template>		<xsl:template match="x:body" mode="ExtractUseCase">		<xsl:variable name="basicInformationTable" select="x:table[@id='1.1']"/>		<xsl:variable name="additionalInformationTable" select="x:table[@id='3.5']"/>				<UseCase>			<xsl:if test="$basicInformationTable/x:tr[3]/x:td[3]/x:p">				<description>					<xsl:value-of select="$basicInformationTable/x:tr[3]/x:td[3]/x:p"/>				</description>			</xsl:if>			<identifier>				<xsl:value-of select="$basicInformationTable/x:tr[3]/x:td[1]/x:p"/>			</identifier>			<name>				<xsl:value-of select="$basicInformationTable/x:tr[3]/x:td[2]/x:p"/>			</name>			<technicalId>				<xsl:value-of select="$basicInformationTable/x:tr[3]/x:td[1]/x:p/@id"/>			</technicalId>						<xsl:apply-templates select="x:table[@id='3.2']" mode="ExtractAssumption"/>						<xsl:apply-templates select="x:table[@id='1.3']" mode="ExtractRelatedBusinessCase"/>						<classification>				<xsl:value-of select="$additionalInformationTable/x:tr[3]/x:td[4]/x:p"/>			</classification>						<xsl:apply-templates select="x:table[@id='3.1']" mode="ExtractCPSGrouping"/>						<xsl:apply-templates select="x:table[@id='3.6']/x:tr[position() > 1]" mode="ExtractCustomInformation"/>						<xsl:apply-templates select="x:table[@id='2']/x:tr[2]/x:td/x:p/x:img"/>						<xsl:apply-templates select="x:table[@id='3.7']/x:tr[position() > 1]" mode="ExtractKeyPerformanceIndicator"/>						<keywords>				<xsl:value-of select="$additionalInformationTable/x:tr[3]/x:td[6]/x:p"/>			</keywords>						<levelOfDepth>				<xsl:value-of select="$additionalInformationTable/x:tr[3]/x:td[2]/x:p"/>			</levelOfDepth>						<xsl:apply-templates select="x:table[@id='1.4']" mode="ExtractNarrative"/>						<nature>				<xsl:value-of select="$additionalInformationTable/x:tr[3]/x:td[5]/x:p"/>			</nature>						<xsl:apply-templates select="x:table[@id='3.3']" mode="ExtractPrerequisite"/>						<prioritisation>				<xsl:value-of select="$additionalInformationTable/x:tr[3]/x:td[3]/x:p"/>			</prioritisation>						<xsl:apply-templates select="x:table[@id='3.4']" mode="ExtractReference"/>						<xsl:apply-templates select="x:table[@id='1.3']" mode="ExtractRelatedObjective"/>						<xsl:apply-templates select="x:table[@id='3.5']" mode="ExtractRelatedUseCase"/>						<xsl:apply-templates select="x:table[@id='1.5']" mode="ExtractRemark"/>						<xsl:apply-templates select="x:table[@id='4']/x:tr[position() > 2]" mode="ExtractScenario"/>						<xsl:apply-templates select="x:table[@id='1.3']" mode="ExtractScope"/>						<xsl:apply-templates select="x:table[@id='1.2']" mode="ExtractVersion"/>		</UseCase>	</xsl:template>	<xsl:template match="x:tr" mode="ExtractCustomInformation">		<CustomInformation>			<xsl:if test="x:td[1][text() != '']">				<key>					<xsl:value-of select="x:td[1]"/>				</key>			</xsl:if>			<xsl:if test="x:td[2][text() != '']">				<reference>					<xsl:value-of select="x:td[2]"/>				</reference>			</xsl:if>			<xsl:if test="x:td[3][text() != '']">				<value>					<xsl:value-of select="x:td[3]"/>				</value>			</xsl:if>		</CustomInformation>	</xsl:template>		<xsl:template match="x:tr" mode="ExtractKeyPerformanceIndicator">		<KeyPerformanceIndicator>			<xsl:if test="x:td[2][text() != '']">				<description>					<xsl:value-of select="x:td[2]"/>				</description>			</xsl:if>						<xsl:if test="x:td[1][text() != '']">				<name>					<xsl:value-of select="x:td[1]"/>				</name>			</xsl:if>						<xsl:for-each select="x:td[3]">				<Objective>					<technicalId><xsl:value-of select="x:p"/></technicalId>				</Objective>			</xsl:for-each>						<technicalId>				<xsl:value-of select="x:td[1]/@id"/>			</technicalId>		</KeyPerformanceIndicator>	</xsl:template>	<xsl:template match="x:table" mode="ExtractVersion">		<Version>			<xsl:if test="x:tr[3]/x:td[4]/x:p">				<approvalStatus>					<xsl:value-of select="x:tr[3]/x:td[4]/x:p"/>				</approvalStatus>			</xsl:if>						<xsl:if test="x:tr[3]/x:td[3]/x:p">				<xsl:for-each select="x:tr[3]/x:td[3]/x:p">					<Author>						<name>							<xsl:value-of select="."/>						</name>					</Author>				</xsl:for-each>			</xsl:if>						<xsl:if test="x:tr[3]/x:td[1]/x:p">				<changes>					<xsl:value-of select="x:tr[3]/x:td[1]/x:p"/>				</changes>			</xsl:if>			<date>				<xsl:value-of select="x:tr[3]/x:td[2]/x:p"/>			</date>						<xsl:if test="x:tr[3]/x:td[5]/x:p">				<versionNumber>					<xsl:value-of select="x:tr[3]/x:td[5]/x:p"/>				</versionNumber>			</xsl:if>		</Version>	</xsl:template>	<xsl:template match="x:table" mode="ExtractScope">		<scope>			<xsl:value-of select="x:tr[3]/x:td/x:p"/>		</scope>	</xsl:template>	<xsl:template match="x:table" mode="ExtractAssumption">		<xsl:for-each select="x:tr[position() > 2]">			<Assumption>				<content>					<xsl:value-of select="x:td[2]/x:p"/>				</content>				<name>					<xsl:value-of select="x:td[1]/x:p"/>				</name>			</Assumption>		</xsl:for-each>	</xsl:template>		<xsl:template match="x:table" mode="ExtractRelatedBusinessCase">		<xsl:for-each select="x:tr[2]/x:td/x:p">			<BusinessCase>				<technicalId>					<xsl:choose>						<xsl:when test="substring-before(., ',')">							<xsl:value-of select="substring-before(., ',')"/>						</xsl:when>						<xsl:otherwise>							<xsl:value-of select="."/>						</xsl:otherwise>					</xsl:choose>				</technicalId>			</BusinessCase>		</xsl:for-each>	</xsl:template>		<xsl:template match="x:table" mode="ExtractCPSGrouping">		<CPSGrouping>			<xsl:for-each select="x:tr[position() > 4]">				<CPS>					<furtherInformation>						<xsl:value-of select="x:td[3]/x:p"/>					</furtherInformation>									<name>						<xsl:value-of select="x:td[1]/x:p"/>					</name>					<technicalId>						<xsl:value-of select="x:td[2]/x:p"/>					</technicalId>				</CPS>			</xsl:for-each>					<xsl:if test="x:tr[3]/x:td[2]/x:p">				<description>					<xsl:value-of select="x:tr[3]/x:td[2]/x:p"/>				</description>			</xsl:if>			<xsl:if test="x:tr[3]/x:td[1]/x:p/@id">				<identifier>					<xsl:value-of select="x:tr[3]/x:td[1]/x:p/@id"/>				</identifier>			</xsl:if>			<xsl:if test="x:tr[3]/x:td[1]/x:p">				<name>					<xsl:value-of select="x:tr[3]/x:td[1]/x:p"/>				</name>			</xsl:if>		</CPSGrouping>	</xsl:template>		<xsl:template match="x:img">		<Drawing>			<drawingType>				<xsl:value-of select="../@id"/>			</drawingType>			<name>				<xsl:value-of select="@alt"/>			</name>			<URI>				<xsl:attribute name="type">					<xsl:value-of select="@id"/>				</xsl:attribute>				<xsl:value-of select="@src"/>			</URI>		</Drawing>	</xsl:template>		<xsl:template match="x:table" mode="ExtractNarrative">		<Narrative>			<completeDescription>				<xsl:value-of select="x:tr[5]/x:td/x:p"/>			</completeDescription>			<shortDescription>				<xsl:value-of select="x:tr[3]/x:td/x:p"/>			</shortDescription>		</Narrative>	</xsl:template>		<xsl:template match="x:table" mode="ExtractPrerequisite">		<xsl:for-each select="x:tr[position() > 1]">			<Prerequisite>				<content>					<xsl:value-of select="x:td[2]/x:p"/>				</content>				<name>					<xsl:value-of select="x:td[1]/x:p"/>				</name>			</Prerequisite>		</xsl:for-each>	</xsl:template>		<xsl:template match="x:table" mode="ExtractReference">		<xsl:for-each select="x:tr[position() > 2]">			<Reference>				<description>					<xsl:value-of select="x:td[4]/x:p"/>				</description>				<identifier>					<xsl:value-of select="x:td[1]/x:p"/>				</identifier>				<impact>					<xsl:value-of select="x:td[6]/x:p"/>				</impact>				<link>					<xsl:value-of select="x:td[8]/x:p"/>				</link>				<name>					<xsl:value-of select="x:td[3]/x:p"/>				</name>				<originatorOrganisation>					<xsl:value-of select="x:td[7]/x:p"/>				</originatorOrganisation>				<status>					<xsl:value-of select="x:td[5]/x:p"/>				</status>				<type>					<xsl:value-of select="x:td[2]/x:p"/>				</type>			</Reference>		</xsl:for-each>	</xsl:template>		<xsl:template match="x:table" mode="ExtractRelatedObjective">		<xsl:for-each select="x:tr[4]/x:td/x:p">			<RelatedObjective>				<description>					<xsl:value-of select="substring-after(., ': ')"/>				</description>				<name>					<xsl:value-of select="substring-before(., ': ')"/>				</name>				<technicalId>					<xsl:value-of select="@id"/>				</technicalId>			</RelatedObjective>		</xsl:for-each>	</xsl:template>		<xsl:template match="x:table" mode="ExtractRelatedUseCase">		<xsl:for-each select="x:tr[3]/x:td[1]/x:p">			<RelatedUseCase>				<name>					<xsl:choose>						<xsl:when test="position() = last()">							<xsl:value-of select="."/>						</xsl:when>						<xsl:otherwise>							<xsl:value-of select="substring-before(., ',')"/>						</xsl:otherwise>					</xsl:choose>				</name>				<technicalId>					<xsl:value-of select="@id"/>				</technicalId>			</RelatedUseCase>		</xsl:for-each>	</xsl:template>		<xsl:template match="x:table" mode="ExtractRemark">		<xsl:for-each select="x:tr[position() > 1]">			<Remark>				<content>					<xsl:value-of select="x:td/x:p"/>				</content>			</Remark>		</xsl:for-each>	</xsl:template>		<xsl:template match="x:tr" mode="ExtractScenario">		<xsl:variable name="scenarioName" select="x:td[2]/x:p"/>			<Scenario>			<xsl:if test="x:td[3]/x:p">				<description>					<xsl:value-of select="x:td[3]/x:p"/>				</description>			</xsl:if>			<identifier>				<xsl:value-of select="x:td[1]/x:p"/>			</identifier>			<name>				<xsl:value-of select="$scenarioName"/>			</name>			<technicalId>				<xsl:value-of select="x:td[1]/x:p/@id"/>			</technicalId>						<xsl:variable name="RequirementNumber">				<xsl:value-of select="x:td[8]/x:p"/>			</xsl:variable>						<xsl:variable name="tempAspectLookup">				<xsl:apply-templates select="../../x:table[@id='4.0.1']" mode="GenerateAspectsLookupTable"/>			</xsl:variable>			<xsl:variable name="AspectsLookup" select="msxsl:node-set($tempAspectLookup)"/>			 			<xsl:copy-of select="$AspectsLookup/entry[@number=$RequirementNumber]/Aspects"/>						<xsl:apply-templates 			mode="ExtractMacroActivity" 			select="../../x:div[@id='ScenarioTables' and x:table[@id='4.1.1' and x:tr[2]/x:td/x:p[text() = $scenarioName]]]/x:table[@id='4.1.2']"/>						<xsl:apply-templates select="x:td[7]/x:p" mode="ExtractPostcondition"/>						<xsl:apply-templates select="x:td[6]/x:p" mode="ExtractPrecondition"/>						<xsl:apply-templates select="x:td[4]/x:p" mode="ExtractPrimaryCPS"/>						<xsl:apply-templates select="x:td[5]/x:p" mode="ExtractTriggeringEvent"/>		</Scenario>	</xsl:template>		<xsl:template match="x:table" mode="ExtractMacroActivity">		<MacroActivity>			<xsl:if test="x:tr[1]/x:td/x:p">				<description>					<xsl:value-of select="x:tr[1]/x:td/x:p"/>				</description>			</xsl:if>					<xsl:apply-templates select="x:tr[3]/x:td/x:p/x:img"/>						<name>				<xsl:value-of select="x:tr[1]/x:th/x:p"/>			</name>						<xsl:apply-templates select="x:tr[5]/x:td/x:p" mode="ExtractPrimaryCPS"/>						<xsl:apply-templates select="x:tr[7]/x:td/x:p" mode="ExtractRequirement"/>						<xsl:apply-templates mode="ExtractStep" select="x:tr[position() > 8]"/>						<technicalId>				<xsl:value-of select="x:tr[1]/x:th/x:p/@id"/>			</technicalId>		</MacroActivity>	</xsl:template>		<xsl:template match="x:tr" mode="ExtractStep">		<Step>			<xsl:for-each select="x:td[8]/x:p">				<BusinessObject>					<name>						<xsl:value-of select="."/>					</name>					<technicalId>						<xsl:value-of select="@id"/>					</technicalId>				</BusinessObject>			</xsl:for-each>			<description>				<xsl:value-of select="x:td[4]/x:p"/>			</description>						<xsl:apply-templates select="x:td[12]/x:p"/>						<event>				<xsl:value-of select="x:td[2]/x:p"/>			</event>			<identifier>				<xsl:value-of select="x:td[1]/x:p"/>			</identifier>						<xsl:for-each select="x:td[6]/x:p">				<InformationProducer>					<name>						<xsl:value-of select="."/>					</name>					<technicalId>						<xsl:value-of select="@id"/>					</technicalId>				</InformationProducer>			</xsl:for-each>						<xsl:for-each select="x:td[7]/x:p">				<InformationReceiver>					<name>						<xsl:value-of select="."/>					</name>					<technicalId>						<xsl:value-of select="@id"/>					</technicalId>				</InformationReceiver>			</xsl:for-each>						<interaction>				<refMessage>					<xsl:value-of select="x:td[9]/x:p"/>				</refMessage>			</interaction>						<name>				<xsl:value-of select="x:td[3]/x:p"/>			</name>						<xsl:for-each select="x:td[10]/x:p">				<Requirement>					<technicalId><xsl:value-of select="."/></technicalId>				</Requirement>			</xsl:for-each>						<service>				<xsl:value-of select="x:td[5]/x:p"/>			</service>						<xsl:variable name="RequirementNumber">				<xsl:value-of select="x:td[11]/x:p"/>			</xsl:variable>						<xsl:variable name="tempAspectLookup">				<xsl:apply-templates select="../../../x:table[@id='4.1.1']" mode="GenerateAspectsLookupTable"/>			</xsl:variable>			<xsl:variable name="AspectsLookup" select="msxsl:node-set($tempAspectLookup)"/>			 			<xsl:copy-of select="$AspectsLookup/entry[@number=$RequirementNumber]/Aspects"/>		</Step>	</xsl:template>		<xsl:template match="x:p" mode="ExtractPostcondition">		<Postcondition>			<xsl:apply-templates select="." mode="ExtractContentAndNameFromString"/>		</Postcondition>	</xsl:template>		<xsl:template match="x:p" mode="ExtractPrecondition">		<Precondition>			<xsl:apply-templates select="." mode="ExtractContentAndNameFromString"/>		</Precondition>	</xsl:template>			<xsl:template match="x:p" mode="ExtractTriggeringEvent">		<TriggeringEvent>			<xsl:apply-templates select="." mode="ExtractContentAndNameFromString"/>		</TriggeringEvent>	</xsl:template>		<xsl:template match="x:p" mode="ExtractPrimaryCPS">		<PrimaryCPS>			<xsl:apply-templates select="." mode="ExtractNameAndTechnicalIdFromP"/>		</PrimaryCPS>	</xsl:template>		<xsl:template match="x:p" mode="ExtractContentAndNameFromString">		<xsl:param name="splitString" select="': '"/>		<content>			<xsl:value-of select="substring-after(., ': ')"/>		</content>		<name>			<xsl:value-of select="substring-before(., ': ')"/>		</name>	</xsl:template>		<xsl:template match="x:p" mode="ExtractNameAndTechnicalIdFromP">		<name>			<xsl:value-of select="."/>		</name>		<technicalId>			<xsl:value-of select="@id"/>		</technicalId>	</xsl:template>		<xsl:template match="x:table" mode="GenerateAspectsLookupTable">		<xsl:for-each select="x:tr[position() > 2]">			<entry>				<xsl:attribute name="number">					<xsl:value-of select="x:td[1]/x:p"/>				</xsl:attribute>								<Aspects>					<xsl:call-template name="ExtractAspectsAccumulator">						<xsl:with-param name="nodes" select="x:td[2]/x:div"/>					</xsl:call-template>				</Aspects>			</entry>		</xsl:for-each>	</xsl:template>		<xsl:template name="ExtractAspectsAccumulator">		<xsl:param name="nodes"/>		<xsl:param name="accumulator"></xsl:param>				<xsl:choose>			<xsl:when test="$nodes">				<xsl:variable name="result">					<xsl:call-template name="ExtractAspectsBranches">						<xsl:with-param name="pathString" select="substring-before($nodes[1]/x:div[1]/x:p, ':')"/>						<xsl:with-param name="subelementTables" select="$nodes[1]/x:div[2]/x:table"/>						<xsl:with-param name="accumulatorNodes" select="msxsl:node-set($accumulator)"/>					</xsl:call-template>				</xsl:variable>							<xsl:call-template name="ExtractAspectsAccumulator">					<xsl:with-param name="nodes" select="$nodes[position() > 1]"/>					<xsl:with-param name="accumulator" select="$result"/>				</xsl:call-template>			</xsl:when>			<xsl:otherwise>				<xsl:copy-of select="$accumulator"/>			</xsl:otherwise>		</xsl:choose>	</xsl:template>		<xsl:template name="ExtractAspectsBranches">		<xsl:param name="pathString"/>		<xsl:param name="subelementTables"/>		<xsl:param name="accumulatorNodes"/>						<xsl:choose>			<xsl:when test="$pathString">				<xsl:variable name="head">					<xsl:choose>						<xsl:when test="substring-before($pathString, '/')">							<xsl:value-of select="substring-before($pathString, '/')"/>						</xsl:when>						<xsl:otherwise>							<xsl:value-of select="$pathString"/>						</xsl:otherwise>					</xsl:choose>				</xsl:variable>				<xsl:variable name="tail" select="substring-after($pathString, '/')"/>								<xsl:for-each select="$accumulatorNodes/*[local-name() != $head]">					<xsl:copy-of select="."/>				</xsl:for-each>								<xsl:element name="{$head}">					<xsl:call-template name="ExtractAspectsBranches">						<xsl:with-param name="pathString" select="$tail"/>						<xsl:with-param name="subelementTables" select="$subelementTables"/>						<xsl:with-param name="accumulatorNodes" select="msxsl:node-set($accumulatorNodes/*[local-name() = $head])"/>					</xsl:call-template>				</xsl:element>			</xsl:when>			<xsl:otherwise>				<xsl:apply-templates select="$subelementTables" mode="ExtractProperties"/>			</xsl:otherwise>		</xsl:choose>	</xsl:template>			<xsl:template match="x:table" mode="ExtractProperties">		<Property>			<xsl:if test="x:tr[x:th[text() = 'Description']]">				<description>					<xsl:value-of select="x:tr[x:th[text() = 'Description']]/x:td/x:p"/>				</description>			</xsl:if>			<xsl:if test="x:tr[x:th[text() = 'Priority']]">				<priority>					<xsl:value-of select="x:tr[x:th[text() = 'Priority']]/x:td/x:p"/>				</priority>			</xsl:if>			<xsl:if test="x:tr[x:th[text() = 'References']]">				<xsl:call-template name="ExtractReferences">					<xsl:with-param name="string" select="x:tr[x:th[text() = 'References']]/x:td/x:p"/>				</xsl:call-template>			</xsl:if>			<xsl:if test="x:tr[x:th[text() = 'Statement']]">				<statement>					<xsl:value-of select="x:tr[x:th[text() = 'Statement']]/x:td/x:p"/>				</statement>			</xsl:if>			<xsl:if test="x:tr[x:th[text() = 'Trace']]">				<trace>					<xsl:value-of select="x:tr[x:th[text() = 'Trace']]/x:td/x:p"/>				</trace>			</xsl:if>		</Property>	</xsl:template>		<xsl:template name="ExtractReferences">		<xsl:param name="string"/>				<xsl:variable name="head">			<xsl:choose>				<xsl:when test="substring-before($string, ', ')">					<xsl:value-of select="substring-before($string, ', ')"/>				</xsl:when>				<xsl:otherwise>					<xsl:value-of select="$string"/>				</xsl:otherwise>			</xsl:choose>		</xsl:variable>		<xsl:variable name="tail" select="substring-after($string, ', ')"/>				<reference>			<xsl:value-of select="$head"/>		</reference>				<xsl:if test="$tail">			<xsl:call-template name="ExtractReferences">				<xsl:with-param name="string" select="$tail"/>			</xsl:call-template>		</xsl:if>	</xsl:template></xsl:stylesheet>