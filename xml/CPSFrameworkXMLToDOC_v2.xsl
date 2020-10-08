<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
	xmlns:cps="cpsframework"
	xmlns:lookup="lookup"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions" 
	xmlns:math="http://www.w3.org/2005/xpath-functions/math" 
	xmlns:array="http://www.w3.org/2005/xpath-functions/array" 
	xmlns:map="http://www.w3.org/2005/xpath-functions/map" 
	xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns="http://www.w3.org/1999/xhtml" 
	xmlns:err="http://www.w3.org/2005/xqt-errors" 
	exclude-result-prefixes="array fn map math xs err msxsl lookup" 
	version="1.0">
	
	<xsl:output method="xml" version="4.0" encoding="UTF-8" omit-xml-declaration="yes" indent="yes"/>
	
	<!--Create and store aspect lookup table. On msxml this will be stored as a string
		and msxsl:node-set must be used to turn it back into xml nodes.-->
	<xsl:variable name="AspectLookupTableString">
		<xsl:call-template name="CreateAspectLookup"/>
	</xsl:variable>
	
	<!--Turns the Aspect lookup table back into xml nodes.-->
	<xsl:variable name="AspectLookupTable" select="msxsl:node-set($AspectLookupTableString)"/>
	
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
					 p, li.MsoNormal, div.MsoNormal
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
					p.MsoBodyText, li.MsoBodyText, div.MsoBodyText
							{mso-style-link:"Body Text Char";
							margin-top:0in;
							margin-right:0in;
							margin-bottom:6.0pt;
							margin-left:0in;
							text-align:justify;
							font-size:10.0pt;
							font-family:"Arial","sans-serif";
							letter-spacing:.4pt;}
					p.MsoDocumentMap, li.MsoDocumentMap, div.MsoDocumentMap
							{mso-style-link:"Document Map Char";
							margin:0in;
							margin-bottom:.0001pt;
							text-align:justify;
							font-size:8.0pt;
							font-family:"Tahoma","sans-serif";
							letter-spacing:.4pt;}
					p.TableHeading, li.TableHeading, div.TableHeading
							{mso-style-name:TableHeading;
							mso-style-link:"TableHeading Char";
							margin:0in;
							margin-bottom:.0001pt;
							font-size:10.0pt;
							font-family:"Arial","sans-serif";
							color:#002060;
							letter-spacing:.4pt;
							font-weight:bold;
							font-style:italic;}
					span.TableHeadingDetail
							{mso-style-name:TableHeadingDetail;
							font-family:"Arial Narrow","sans-serif";
							color:navy;
							font-weight:normal;
							font-style:italic;}
					span.DocumentMapChar
							{mso-style-name:"Document Map Char";
							mso-style-link:"Document Map";
							font-family:"Tahoma","sans-serif";
							letter-spacing:.4pt;}
					span.Heading2Char
							{mso-style-name:"Heading 2 Char";
							mso-style-link:"Heading 2";
							font-family:"Cambria","serif";
							color:#4F81BD;
							letter-spacing:.4pt;
							font-weight:bold;}
					span.Heading1Char
							{mso-style-name:"Heading 1 Char";
							mso-style-link:"Heading 1";
							font-family:"Cambria","serif";
							color:#365F91;
							letter-spacing:.4pt;
							font-weight:bold;}
					span.BodyTextChar
							{mso-style-name:"Body Text Char";
							mso-style-link:"Body Text";
							font-family:"Arial","sans-serif";
							letter-spacing:.4pt;}
					span.TableHeadingChar
							{mso-style-name:"TableHeading Char";
							mso-style-link:TableHeading;
							font-family:"Arial","sans-serif";
							color:#002060;
							letter-spacing:.4pt;
							font-weight:bold;
							font-style:italic;}
					.MsoChpDefault
							{font-family:"Calibri","sans-serif";}
					.MsoPapDefault
							{margin-bottom:10.0pt;
							line-height:115%;}
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
					<xsl:with-param name="parentName" select="'BusinessCase'"/>
					<xsl:with-param name="grandparentId" select="generate-id(cps:CPSFramework)"/>
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
				
				<h1>4       Step by Step Analysis of Use Case
				</h1>
				<table id="4">
					<tr>
						<th colspan="7">Scenario Conditions</th>
					</tr>
					<tr>
						<th>No.</th>
						<th>Scenario Name</th>
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
					<xsl:with-param name="parentName" select="'Scenario'"/>
					<xsl:with-param name="grandparentId" select="generate-id(cps:CPSFramework/UseCase)"/>
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
					<xsl:with-param name="parentName" select="'InformationModel'"/>
					<xsl:with-param name="grandparentId" select="generate-id(cps:CPSFramework/InformationModelLibrary)"/>
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
					<xsl:with-param name="parentName" select="'influence'"/>
					<xsl:with-param name="grandparentId" select="generate-id(cps:CPSFramework/InteractionLibrary/Influences)"/>
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
					<xsl:with-param name="parentName" select="'message'"/>
					<xsl:with-param name="grandparentId" select="generate-id(cps:CPSFramework/InteractionLibrary/Messages)"/>
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
						<th>Logical</th>
						<th>Physical</th>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/CPSLibrary/cps"/>
					
				</table>
				
				<xsl:call-template name="GenerateAspectsTableFromGreatGrandparentId">
					<xsl:with-param name="id" select="'7.1.1'"/>
					<xsl:with-param name="parentName">
						<string>Logical</string>
						<string>Physical</string>
					</xsl:with-param>
					<xsl:with-param name="greatGrandparentId" select="generate-id(cps:CPSFramework/CPSLibrary)"/>
				</xsl:call-template>
				
				<h2>7.2 Systems</h2>
				<table id="7.2">
					<tr>
						<th>Identifier</th>
						<th>Name</th>
						<th>Description</th>
						<th>Type</th>
						<th>Domains</th>
						<th>Human</th>
					</tr>
				</table>
				
				<h2>Maturity</h2>
				
				<table>
					<xsl:apply-templates select="cps:CPSFramework/CPSLibrary/Maturity"/>
				</table>
				
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="cps">
		<tr>
			<xsl:apply-templates select="identifier" mode="td">
				<xsl:with-param name="id" select="technicalId"/>
			</xsl:apply-templates>
			
			<xsl:apply-templates select="name" mode="td"/>
			
			<xsl:apply-templates select="description" mode="td"/>
			
			<xsl:apply-templates select="type" mode="td"/>
			
			<td>
				<xsl:apply-templates select="Domain"/>
			</td>
			
			<td>
				<xsl:apply-templates select="Logical"/>
			</td>
			
			<td>
				<xsl:apply-templates select="Physical"/>
			</td>
		</tr>
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
							<!--TODO-->
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
							<!--TODO-->
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
	
	<!--This template outputs a <td> element for any element 
		with optional width and <p> id attributes.-->
	<xsl:template match="*" mode="td">
		<xsl:param name="id" select="''"/>
		
		<td>
			<p>
				<xsl:if test="$id != ''">
					<xsl:attribute name="id">
						<xsl:value-of select="$id"/>
					</xsl:attribute>
				</xsl:if>			
			
				<xsl:value-of select="."/>
			</p>
		</td>
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
					<xsl:call-template name="GetAspectNumberFromLookup">
						<xsl:with-param name="aspectNode" select="Aspects"/>
					</xsl:call-template>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: BusinessCase/Domain/type-->
					<xsl:value-of select="type"/>
				</p>
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
				<p>
					<!--LOOKUP: UseCase/Version/changes-->
					<xsl:value-of select="changes"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: UseCase/Version/date-->
					<xsl:value-of select="date"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: "UseCase/Version/Author/name"
						multiple names are join with a ', '.-->
					<xsl:call-template name="StringJoin">
						<xsl:with-param name="values" select="Author/name"/>
						<xsl:with-param name="joinString" select="', '"/>
					</xsl:call-template>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: UseCase/Version/approvalStatus-->
					<xsl:value-of select="approvalStatus"/>
				</p>
			</td>
			<td>
				<p>
					<!--LOOKUP: UseCase/Version/versionNumber-->
					<xsl:value-of select="versionNumber"/>
				</p>
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
					<p>
						<!--LOOKUP: UseCase/CPSGrouping/identifier-->
						<xsl:attribute name="id">
							<xsl:value-of select="identifier"/>
						</xsl:attribute>
					
						<!--LOOKUP: UseCase/CPSGrouping/name-->
						<xsl:value-of select="name"/>
					</p>
				</td>
				<td colspan="2">
					<p>
						<!--LOOKUP: UseCase/CPSGrouping/description-->
						<xsl:value-of select="description"/>
					</p>
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
					<xsl:call-template name="GetAspectNumberFromLookup">
						<xsl:with-param name="aspectNode" select="Aspects"/>
					</xsl:call-template>
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
					<th colspan="9">Scenario</th>
				</tr>
				<tr>
					<th colspan="2">Scenario Name :</th>
					<td colspan="7">
						<p>
							<!--LOOKUP: Scenario/name-->
							<xsl:value-of select="name"/>
						</p>
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
					<th>Requirements , R-ID</th>
				</tr>
			</table>			
				
			<xsl:apply-templates select="MacroActivity"/>
		</div>
		
		<xsl:call-template name="GenerateAspectsTableFromGreatGrandparentId">
			<xsl:with-param name="id" select="'4.1.1'"/>
			<xsl:with-param name="parentName" select="'Step'"/>
			<xsl:with-param name="greatGrandparentId" select="generate-id(.)"/>
		</xsl:call-template>
	</xsl:template>
	
	<!--Ouptut sub tables for a MacroActivity.-->
	<xsl:template match="MacroActivity">
		<table id="4.1.2">
			<tr id="MacroActivity">
				<th colspan="9">
					<p class="TableHeading">
						<xsl:attribute name="id">
							<!--LOOKUP: MacroActivity/technicald-->
							<xsl:value-of select="technicalId"/>
						</xsl:attribute>
					
						<!--LOOKUP: Macroactivity/name-->
						<xsl:value-of select="name"/>
					</p>
				</th>
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
					<xsl:call-template name="GetAspectNumberFromLookup">
						<xsl:with-param name="aspectNode" select="Aspects"/>
						<xsl:with-param name="useGrandparentNumber" select="true()"/>
					</xsl:call-template>
				</p>
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
					<xsl:call-template name="GetAspectNumberFromLookup">
						<xsl:with-param name="aspectNode" select="Aspects"/>
					</xsl:call-template>
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
					<xsl:call-template name="GetAspectNumberFromLookup">
						<xsl:with-param name="aspectNode" select="Aspects"/>
					</xsl:call-template>
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
					<xsl:call-template name="GetAspectNumberFromLookup">
						<xsl:with-param name="aspectNode" select="Aspects"/>
					</xsl:call-template>
				</p>
			</td>
		</tr>
	</xsl:template>

	<!--Outputs a Drawing as an html img element. Images will be placed on their own lines
		use a p element.-->
	<xsl:template match="Drawing">
		<p>
			<xsl:element name="img">
				<xsl:attribute name="id">
					<xsl:value-of select="drawingType"/>
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

	<!--Generates an aspect table with the Aspects that match the given id, parentName, and grandparentId.-->
	<xsl:template name="GenerateAspectsTable">
		<xsl:param name="id"/>
		<xsl:param name="parentName"/>
		<xsl:param name="grandparentId"/>
		
		<xsl:variable name="parentNameNodeset" select="msxsl:node-set($parentName)"/>
		
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
			
			<xsl:for-each select="$parentNameNodeset">
				<xsl:variable name="parent" select="."/>
				<xsl:apply-templates select="$AspectLookupTable/lookup:entry[@parentName = $parent and @grandparentId = $grandparentId]"/>
			</xsl:for-each>
			
		</table>
	</xsl:template>
	
	<!--Generates an aspect table with the Aspects that match the given id, parentName, and greatgrandparentId.
		This is necessary for outputing aspect tables for steps in the right locations.-->
	<xsl:template name="GenerateAspectsTableFromGreatGrandparentId">
		<xsl:param name="id"/>
		<xsl:param name="parentName"/>
		<xsl:param name="greatGrandparentId"/>
		
		<xsl:variable name="parentNameNodeset" select="msxsl:node-set($parentName)"/>		
		
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
				
			<xsl:for-each select="$parentNameNodeset">
				<xsl:variable name="parent" select="."/>
				<xsl:apply-templates select="$AspectLookupTable/lookup:entry[@parentName = $parent and @greatGrandparentId = $greatGrandparentId]">
					<xsl:with-param name="useGrandparentNumber" select="true()"/>
				</xsl:apply-templates>
			</xsl:for-each>
			
		</table>
	</xsl:template>

	<!--This template generates rows for the Requirements table based on the entries in the AspectLookupTable variable.-->
	<xsl:template match="lookup:entry">
		<xsl:param name="useGrandparentNumber" select="false()"/>
		<tr>
			<td>
				<p>
					<xsl:choose>
						<xsl:when test="$useGrandparentNumber">
							<xsl:value-of select="@grandparentNumber"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="@number"/>
						</xsl:otherwise>
					</xsl:choose>
				</p>
			</td>
			<td>
				<xsl:apply-templates select="Aspects"/>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="Aspects">
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

	<!--Creates an intermediary xml document based on all the Asepcts in the source document
		in order to generate the Requirements table and create links to the rest of thet document.-->
	<xsl:template name="CreateAspectLookup">
		<xsl:for-each select="//Aspects">
			<xsl:variable name="parentName" select="name(..)"/>
			<xsl:variable name="grandparentName" select="name(../..)"/>
		
			<lookup:entry>
				<xsl:attribute name="id">
					<xsl:value-of select="generate-id(.)"/>
				</xsl:attribute>
				<xsl:attribute name="number">
					<xsl:value-of select="count(../preceding-sibling::*[name() = $parentName and Aspects]) + 1"/>
				</xsl:attribute>
				<xsl:attribute name="grandparentNumber">
					<xsl:value-of select="count(../../preceding-sibling::*/*[name() = $parentName and Aspects]) + 1"/>
				</xsl:attribute>
				<xsl:attribute name="parentName">
					<xsl:value-of select="$parentName"/>
				</xsl:attribute>
				<xsl:attribute name="grandparentId">
					<xsl:value-of select="generate-id(../..)"/>
				</xsl:attribute>
				<xsl:attribute name="greatGrandparentId">
					<xsl:value-of select="generate-id(../../..)"/>
				</xsl:attribute>
				<xsl:copy-of select="."/>
			</lookup:entry>
		</xsl:for-each>
	</xsl:template>

	<!--Outputs the number of the given Aspects element from the lookup table.-->
	<xsl:template name="GetAspectNumberFromLookup">
		<xsl:param name="aspectNode"/>
		<xsl:param name="useGrandparentNumber" select="false()"/>
		
		<xsl:choose>
			<xsl:when test="$useGrandparentNumber">
				<xsl:value-of select="$AspectLookupTable/lookup:entry[@id = generate-id($aspectNode)]/@grandparentNumber"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$AspectLookupTable/lookup:entry[@id = generate-id($aspectNode)]/@number"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

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
