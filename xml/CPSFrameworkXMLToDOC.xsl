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
					 p.MsoNormal, li.MsoNormal, div.MsoNormal
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
					td.TableHeader
						{border:solid windowtext 1.0pt;
						background:#CCCCCC;
						padding:0in 5.4pt 0in 5.4pt;
						height:10.75pt}
					td.TableCell
						{border:solid windowtext 1.0pt;
						padding:0in 5.4pt 0in 5.4pt;
						height:11.8pt;
						vertical-align: text-top}
					table
						{width:100.0%;
						border-collapse:collapse;
						border:none}
					-->
					/*]]>*/
				</style>
				<!--<title></title>-->
				<xsl:text disable-output-escaping="yes">&lt;title&gt;&lt;/title&gt;</xsl:text>
			</head>
			<body>
				<h1>
					<span lang="EN-GB" xml:lang="EN-GB">0       Description of the Business Case</span>
				</h1>			
				<table id="0">
					<tr style="height:10.75pt">
						<td width="15%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">ID</span>
							</p>
						</td>
						<td width="15%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Name</span>
							</p>
						</td>
						<td width="15%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Domain(s)</span>
							</p>
						</td>
						<td width="30%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Description</span>
							</p>
						</td>
						<td width="15%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Requirements R-ID</span>
							</p>
						</td>
						<td width="15%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Type</span>
							</p>
						</td>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/BusinessCase"/>
					
				</table>
				
				<xsl:call-template name="GenerateAspectsTable">
					<xsl:with-param name="id" select="'0.1'"/>
					<xsl:with-param name="parentName" select="'BusinessCase'"/>
					<xsl:with-param name="grandparentId" select="generate-id(cps:CPSFramework)"/>
				</xsl:call-template> 
			
				<h1>
					<span lang="EN-GB" xml:lang="EN-GB">1       Description of the Use Case</span>
				</h1>
				<h2>
					<span lang="EN-GB" xml:lang="EN-GB">1.1    Name of Use Case</span>
				</h2>
				<table id="1.1">
					<tr style="height:10.75pt">
						<td width="100%" colspan="3" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Use Case Identification</span>
							</p>
						</td>
					</tr>
					<tr style="height:10.75pt">
						<td width="7%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">ID</span>
							</p>
						</td>
						<td width="20%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Domain(s)</span>
							</p>
						</td>
						<td width="72%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Name of Use Case</span>
							</p>
						</td>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/UseCase"/>
					
				</table>
				
				<h2>
					<span lang="EN-GB" xml:lang="EN-GB">1.2    Version Management</span>
				</h2>
				<table id="1.2">
					<tr style="height:1.0pt">
						<td width="100%" colspan="7" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Version Management</span>
							</p>
						</td>
					</tr>
					<tr>
						<td width="10%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Version Management Changes</span>
							</p>
						</td>
						<td width="10%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Date</span>
							</p>
						</td>
						<td width="10%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Name<br/>Author(s)  or Committee</span>
							</p>
						</td>
						<td width="10%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Approval Status</span>
							</p>
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">draft, for comments, for voting, final</span>
							</p>
						</td>
						<td width="10%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Version Number</span>
							</p>
						</td>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/UseCase/Version"/>
					
				</table>
				
				<table id="1.2.1" style="margin-top:16px">
					<tr>
						<td width="100%" colspan="5" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Maturity</span>
							</p>
						</td>
					</tr>
					<tr>
						<td  width="20%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Effective</span>
							</p>						
						</td>
						<td width="20%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Maturity</span>
							</p>	
						</td>
						<td width="20%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Responsible Party</span>
							</p>	
						</td>
						<td width="20%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Revision</span>
							</p>	
						</td>
						<td width="20%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Status</span>
							</p>	
						</td>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/Maturity"/>
					
				</table>
				
				<h2>
					<span lang="EN-GB" xml:lang="EN-GB">1.3    Scope and Objectives of Use Case</span>
				</h2>
				<table id="1.3">
					<tr style="height:17.2pt">
						<td width="100%" colspan="2" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Scope and Objectives of Use Case</span>
							</p>
						</td>
					</tr>
					
					<xsl:call-template name="ScopeAndObjectives"/>
					
				</table>
				
				<h2>
					<span lang="EN-GB" xml:lang="EN-GB">1.4    Narrative of Use Case</span>
				</h2>
				<table id="1.4">
					<tr style="height:1.0pt">
						<td width="100%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Narrative of Use Case</span>
							</p>
						</td>
					</tr>

					<xsl:apply-templates select="cps:CPSFramework/UseCase/Narrative"/>					
					
				</table>
				
				<h2>
					<span lang="EN-GB" xml:lang="EN-GB">1.5    General Remarks</span>
				</h2>
				<table id="1.5">
					<tr>
						<td width="100%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">General Remarks</span>
							</p>
						</td>
					</tr>

					<xsl:apply-templates select="cps:CPSFramework/UseCase/Remark"/>

				</table>
				
				<h1>
					<span lang="EN-GB" xml:lang="EN-GB">2       Diagrams of Use Case</span>
				</h1>
				<table id="2">
					<tr>
						<td width="100%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Diagram of Use Case</span>
							</p>
						</td>
					</tr>
					<tr>
						<td width="100%" class="TableCell">
							<xsl:apply-templates select="/cps:CPSFramework/UseCase/Drawing"/>
						</td>
					</tr>
				</table>
				
				<h1>
					<span lang="EN-GB" xml:lang="EN-GB">3       Technical Details</span>
				</h1>
				<h2>
					<span lang="EN-GB" xml:lang="EN-GB">3.1    Actors: People, Systems, Applications, Databases, the Power System, and Other Stakeholders</span>
				</h2>
				
				<xsl:apply-templates select="cps:CPSFramework/UseCase/CPSGrouping"/>
				
				<h2>
					<span lang="EN-GB" xml:lang="EN-GB">3.2    Preconditions, Assumptions, Post condition, Events</span>
				</h2>
				<table id="3.2">
					<tr>
						<td width="100%" colspan="4" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Use Case Conditions</span>
							</p>
						</td>
					</tr>
					<tr>
						<td width="32%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Assumption name</span>
							</p>
						</td>
						<td width="33%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Assumption content</span>
							</p>
						</td>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/UseCase/Assumption"/>
					
				</table>
					
				<table id="3.3">
					<tr>
						<td width="32%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Prerequisite name</span>
							</p>
						</td>
						<td width="33%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Prerequisite content</span>
							</p>
						</td>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/UseCase/Prerequisite"/>
					
				</table>
				
				<h2>
					<span lang="EN-GB" xml:lang="EN-GB">3.3    References / Issues</span>
				</h2>
				<table id="3.4">
					<tr>
						<td width="100%" colspan="8" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">References</span>
							</p>
						</td>
					</tr>
					<tr>
						<td width="5%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">No.</span>
							</p>
						</td>
						<td width="15%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">References Type</span>
							</p>
						</td>
						<td width="15%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Reference</span>
							</p>
						</td>
						<td width="10%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Description</span>
							</p>
						</td>
						<td width="10%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Status</span>
							</p>
						</td>
						<td width="15%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Impact on Use Case</span>
							</p>
						</td>
						<td width="15%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Originator / Organisation</span>
							</p>
						</td>
						<td width="15%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Link</span>
							</p>
						</td>
					</tr>
						
					<xsl:apply-templates select="cps:CPSFramework/UseCase/Reference"/>
					
				</table>				
				
				<h2>
					<span lang="EN-GB" xml:lang="EN-GB">3.4    Further Information to the Use Case for Classification / Mapping</span>
				</h2>				
				<table id="3.5">				
					<tr>
						<td width="100%" colspan="6" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Classification Information</span>
							</p>
						</td>
					</tr>
					<tr>
						<td width="10%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Relation to Other Use Cases</span>
							</p>
						</td>
						<td width="10%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Level of Depth</span>
							</p>
						</td>
						<td width="10%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Prioritisation</span>
							</p>
						</td>
						<td width="10%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Generic, Regional or National Relation</span>
							</p>
						</td>
						<td width="10%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">View</span>
							</p>
						</td>
						<td width="10%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Further Keywords  for Classification</span>
							</p>
						</td>
					</tr>
					
					<xsl:call-template name="FurtherInformation"/>
					
				</table>
				
				<h1>
					<span lang="EN-GB" xml:lang="EN-GB">4       Step by Step Analysis of Use Case</span>
				</h1>
				<table id="4">
					<tr style="height:14.35pt">
						<td width="100%" colspan="7" class="TableHeader">
							<p class="TableHeading"><span lang="EN-GB" xml:lang="EN-GB">Scenario Conditions</span></p>
						</td>
					</tr>
					<tr>
						<td width="5%" class="TableHeader">
							<p class="TableHeading"><span lang="EN-GB" xml:lang="EN-GB">No.</span></p>
						</td>
						<td width="18%" class="TableHeader">
							<p class="TableHeading"><span lang="EN-GB" xml:lang="EN-GB">Scenario Name</span></p>
						</td>
						<td width="18%" class="TableHeader">
							<p class="TableHeading"><span lang="EN-GB" xml:lang="EN-GB">Primary Actor</span></p>
						</td>
						<td width="18%" class="TableHeader">
							<p class="TableHeading"><span lang="EN-GB" xml:lang="EN-GB">Triggering Event</span></p>
						</td>
						<td width="18%" class="TableHeader">
							<p class="TableHeading"><span lang="EN-GB" xml:lang="EN-GB">Pre-Condition</span></p>
						</td>
						<td width="18%" class="TableHeader">
							<p class="TableHeading"><span lang="EN-GB" xml:lang="EN-GB">Post-Condition</span></p>
						</td>
						<td width="5%" class="TableHeader">
							<p class="TableHeading"><span lang="EN-GB" xml:lang="EN-GB">Requirements R-ID</span></p>
						</td>
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
					<span lang="EN-GB" xml:lang="EN-GB">5       Information Exchanged</span>
				</h1>
				<table id="5">
					<tr>
						<td width="100%" colspan="5" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Information Maturity</span>
							</p>
						</td>
					</tr>
					<tr>
						<td  width="20%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Effective</span>
							</p>						
						</td>
						<td width="20%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Maturity</span>
							</p>	
						</td>
						<td width="20%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Responsible Party</span>
							</p>	
						</td>
						<td width="20%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Revision</span>
							</p>	
						</td>
						<td width="20%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Status</span>
							</p>	
						</td>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/InformationModelLibrary/Maturity"/>
					
				</table>
				
				<table id="5.0.1" style="margin-top:16px">
					<tr>
						<td width="100%" colspan="4" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Information Exchanged</span>
							</p>
						</td>
					</tr>
					<tr>
						<td width="20%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Name of Information Exchanged</span>
							</p>
						</td>
						<td width="40%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Description of Information Exchanged</span>
							</p>
						</td>
						<td width="30%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Requirements to information data</span>
							</p>
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">R-ID</span>
							</p>
						</td>
						<td width="30%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Requirements R-ID</span>
							</p>
						</td>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/InformationModelLibrary/InformationModel"/>
					
				</table>
				
				<xsl:call-template name="GenerateAspectsTable">
					<xsl:with-param name="id" select="'5.0.2'"/>
					<xsl:with-param name="parentName" select="'InformationModel'"/>
					<xsl:with-param name="grandparentId" select="generate-id(cps:CPSFramework/InformationModelLibrary)"/>
				</xsl:call-template>
				
				<h1>
					<span lang="EN-GB" xml:lang="EN-GB">6       Interactions</span>
				</h1>
				
				<h2>
					<span lang="EN-GB" xml:lang="EN-GB">6.1 Interaction Libary Maturity</span>
				</h2>	
				<table id="6.1">
					<tr>
						<td width="100%" colspan="5" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Interaction Maturity</span>
							</p>
						</td>
					</tr>
					<tr>
						<td  width="20%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Effective</span>
							</p>						
						</td>
						<td width="20%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Maturity</span>
							</p>	
						</td>
						<td width="20%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Responsible Party</span>
							</p>	
						</td>
						<td width="20%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Revision</span>
							</p>	
						</td>
						<td width="20%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Status</span>
							</p>	
						</td>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/InteractionLibrary/Maturity"/>
					
				</table>
				
				<h2>
					<span lang="EN-GB" xml:lang="EN-GB">6.2 Influences</span>
				</h2>
				<table id="6.2">
					<tr>
						<td width="100%" colspan="3" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Influences</span>
							</p>
						</td>
					</tr>
					<tr>
						<td width="20%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Name</span>
							</p>
						</td>
						<td width="70%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Description</span>
							</p>
						</td>
						<td width="10%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Requirement R-ID</span>
							</p>
						</td>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/InteractionLibrary/Influences/influence"/>
					
				</table>
				
				<xsl:call-template name="GenerateAspectsTable">
					<xsl:with-param name="id" select="'6.2.1'"/>
					<xsl:with-param name="parentName" select="'influence'"/>
					<xsl:with-param name="grandparentId" select="generate-id(cps:CPSFramework/InteractionLibrary/Influences)"/>
				</xsl:call-template>
				
				<h2>
					<span lang="EN-GB" xml:lang="EN-GB">6.3 Messages</span>
				</h2>
				<table id="6.3">
					<tr>
						<td width="100%" colspan="3" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Messages</span>
							</p>
						</td>
					</tr>
					<tr>
						<td width="20%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Name</span>
							</p>
						</td>
						<td width="70%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Description</span>
							</p>
						</td>
						<td width="10%" class="TableHeader">
							<p class="TableHeading">
								<span lang="EN-GB" xml:lang="EN-GB">Requirement R-ID</span>
							</p>
						</td>
					</tr>
					
					<xsl:apply-templates select="cps:CPSFramework/InteractionLibrary/Messages/message"/>
					
				</table>
				
				<xsl:call-template name="GenerateAspectsTable">
					<xsl:with-param name="id" select="'6.3.1'"/>
					<xsl:with-param name="parentName" select="'message'"/>
					<xsl:with-param name="grandparentId" select="generate-id(cps:CPSFramework/InteractionLibrary/Messages)"/>
				</xsl:call-template>
			</body>
		</html>
	</xsl:template>
	
	<!--This template outputs information related to a BusinessCases.
		This includes the technicalId, identifier, name, description, type, and Domains.-->
	<xsl:template match="BusinessCase">
		<tr style="height:11.8pt">
			<td width="15%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: BusinessCase/technicalId-->
					<xsl:attribute name="id">
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
					
					<!--LOOKUP: BusinessCase/identifier-->
					<xsl:value-of select="identifier"/>
				</p>
			</td>
			<td width="15%" class="TableCell">
				
				<p class="MsoNormal">
					<!--LOOKUP: BusinessCase/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
			<td width="15%" class="TableCell">
				<xsl:for-each select="Domain">
					<p class="MsoNormal">
						<!--LOOKUP: BusinessCase/Domain/technicalId-->
						<xsl:attribute name="id">
							<xsl:value-of select="technicalId"/>
						</xsl:attribute>
						
						<!--LOOKUP: BusinessCase/Domain/name-->
						<xsl:value-of select="name"/>
					</p>
				</xsl:for-each>
			</td>
			<td width="30%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: BusinessCase/Domain/description-->
					<xsl:value-of select="description"/>
				</p>
			</td>
			<td width="15%" class="TableCell">
				<p class="MsoNormal">
					<!--Get requirement number from lookup table-->
					<xsl:call-template name="GetAspectNumberFromLookup">
						<xsl:with-param name="aspectNode" select="Aspects"/>
					</xsl:call-template>
				</p>
			</td>
			<td width="15%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: BusinessCase/Domain/type-->
					<xsl:value-of select="type"/>
				</p>
			</td>
		</tr>
	</xsl:template>
	
	<!--This template outputs basic information related to the UseCase. 
		This includes the technicalId, identifier, and name.-->
	<xsl:template match="UseCase">
		<tr style="height:11.8pt">
			<td width="7%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: UseCase/technicalId-->
					<xsl:attribute name="id">
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
					
					<!--LOOKUP: UseCase/Identifier-->
					<xsl:value-of select="identifier"/>
				</p>
			</td>
			<td width="20%" class="TableCell">
				<p class="MsoNormal">
					<span lang="EN-GB" xml:lang="EN-GB">
						<!-- FIXME:
						<xsl:value-of select="/n1:CPSFramework/BusinessCase/Domain/name"/>
						<xsl:for-each select="/n1:CPSFramework/UseCase/AdditionalDomain">
							<xsl:text>, </xsl:text>
							<xsl:value-of select="name"/>
						</xsl:for-each>-->
					</span>
				</p>
			</td>
			<td width="72%" class="TableCell">
				<p class="MsoNormal">
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
				<td width="24%" class="TableHeader">
					<p class="TableHeading">
						<span lang="EN-GB" xml:lang="EN-GB">Related business case</span>
					</p>
				</td>
				<td width="75%" class="TableCell">
					<!--LOOKUP: UseCase/BusinessCase/technicalId-->
					<xsl:for-each select="BusinessCase">
						<p class="MsoNormal">
							<xsl:value-of select="technicalId"/>
							<xsl:if test="position() &lt; last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</p>
					</xsl:for-each>
				</td>
			</tr>
			<tr>
				<td width="24%" class="TableHeader">
					<p class="TableHeading">
						<span lang="EN-GB" xml:lang="EN-GB">Scope</span>
					</p>
				</td>
				<td width="75%" class="TableCell">
					<p class="MsoNormal">
						<!--LOOKUP: UseCase/Scope-->
						<xsl:value-of select="scope"/>
					</p>
				</td>
			</tr>
			<tr>
				<td width="24%" class="TableHeader">
					<p class="TableHeading">
						<span lang="EN-GB" xml:lang="EN-GB">Objective</span>
					</p>
				</td>
				<td width="75%" class="TableCell">
					<xsl:for-each select="RelatedObjective">
						<p class="MsoNormal">
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
			<td width="100%" class="TableCell">
				<p class="MsoNormal">
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
			<td width="10%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: UseCase/Version/changes-->
					<xsl:value-of select="changes"/>
				</p>
			</td>
			<td width="10%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: UseCase/Version/date-->
					<xsl:value-of select="date"/>
				</p>
			</td>
			<td width="10%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: "UseCase/Version/Author/name"
						multiple names are join with a ', '.-->
					<xsl:call-template name="StringJoin">
						<xsl:with-param name="values" select="Author/name"/>
						<xsl:with-param name="joinString" select="', '"/>
					</xsl:call-template>
				</p>
			</td>
			<td width="10%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: UseCase/Version/approvalStatus-->
					<xsl:value-of select="approvalStatus"/>
				</p>
			</td>
			<td width="10%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: UseCase/Version/versionNumber-->
					<xsl:value-of select="versionNumber"/>
				</p>
			</td>
		</tr>
	</xsl:template>
	
	<!--This template adds a rows to the 1.4 table for any Narrative elements.-->
	<xsl:template match="Narrative">
		<tr style="height:1.0pt">
			<td width="100%" class="TableHeader">
				<p class="TableHeading">
					<span lang="EN-GB" xml:lang="EN-GB">Short description - max 3 sentences</span>
				</p>
			</td>
		</tr>
		<tr style="height:1.0pt">
			<td width="100%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: UseCase/Narrative/shortDescription-->
					<xsl:value-of select="shortDescription"/>
				</p>
			</td>
		</tr>
		<tr style="height:1.0pt">
			<td width="100%" class="TableHeader">
				<p class="TableHeading">
					<span lang="EN-GB" xml:lang="EN-GB">Complete description</span>
				</p>
			</td>
		</tr>				
		<tr style="height:1.0pt">
			<td width="100%" class="TableCell">
				<p class="MsoNormal">
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
				<td width="100%" colspan="4" class="TableHeader">
					<p class="TableHeading">
						<span lang="EN-GB" xml:lang="EN-GB">Actors</span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="42%" colspan="2" class="TableHeader">
					<p class="TableHeading">
						<span lang="EN-GB" xml:lang="EN-GB">Grouping (Community)</span>
					</p>
				</td>
				<td width="57%" colspan="2" class="TableHeader">
					<p class="TableHeading">
						<span lang="EN-GB" xml:lang="EN-GB">Group Description</span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="42%" colspan="2" class="TableCell">
					<p class="MsoNormal">
						<!--LOOKUP: UseCase/CPSGrouping/identifier-->
						<xsl:attribute name="id">
							<xsl:value-of select="identifier"/>
						</xsl:attribute>
					
						<!--LOOKUP: UseCase/CPSGrouping/name-->
						<xsl:value-of select="name"/>
					</p>
				</td>
				<td width="57%" colspan="2" class="TableCell">
					<p class="MsoNormal">
						<!--LOOKUP: UseCase/CPSGrouping/description-->
						<xsl:value-of select="description"/>
					</p>
				</td>
			</tr>
			<tr>
				<td width="22%" class="TableHeader">
					<p class="TableHeading">
						<span lang="EN-GB" xml:lang="EN-GB">Actor Name</span>
					</p>
					<p class="TableHeading">
						<span lang="EN-GB" xml:lang="EN-GB">see Actor  List</span>
					</p>
				</td>
				<td width="20%" class="TableHeader">
					<p class="TableHeading">
						<span lang="EN-GB" xml:lang="EN-GB">Actor Type</span>
					</p>
					<p class="TableHeading">
						<span lang="EN-GB" xml:lang="EN-GB">see Actor  List</span>
					</p>
				</td>
				<td width="56%" class="TableHeader">
					<p class="TableHeading">
						<span lang="EN-GB" xml:lang="EN-GB">Further information specific to this Use Case</span>
					</p>
				</td>
			</tr>
			
			<xsl:apply-templates select="CPS"/>

		</table>
	</xsl:template>
	
	<!--Output information for CPS element-->
	<xsl:template match="CPS">
		<tr>
			<td width="22%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: CPSGrouping/CPS/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
			<td width="20%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: CPSGrouping/CPS/technicalId-->
					<xsl:value-of select="technicalId"/>
				</p>
			</td>
			<td width="56%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: CPSGrouping/CPS/furtherInformation-->
					<xsl:value-of select="furtherInformation"/>
				</p>
			</td>
		</tr>
	</xsl:template>
	
	<!--Output UseCase Precondition and Assumption elements.-->
	<xsl:template match="Prerequisite">
		<tr>
			<td width="25%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: Prerequisite/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
			
			<td width="75%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: Prerequisite/content-->
					<xsl:value-of select="content"/>	
				</p>
			</td>
		</tr>
	</xsl:template>
	
	<!--Outputs an assumption table row.-->
	<xsl:template match="Assumption">
		<tr>
			<td width="25%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: Assumption/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
			
			<td width="75%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: Assumption/content-->
					<xsl:value-of select="content"/>	
				</p>
			</td>
		</tr>
	</xsl:template>
	
	<!--Output UseCase Reference element.-->
	<xsl:template match="Reference">
		<tr>
			<td width="5%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: UseCase/technicalId-->
					<xsl:attribute name="id">
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
					
					<!--LOOKUP: UseCase/Reference/identifier-->
					<xsl:value-of select="identifier"/>
				</p>
			</td>
			<td width="15%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: UseCase/Reference/type-->
					<xsl:value-of select="type"/>
				</p>
			</td>
			<td width="15%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: UseCase/Reference/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
			<td width="10%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: UseCase/Reference/description-->
					<xsl:value-of select="description"/>
				</p>
			</td>
			<td width="10%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: UseCase/Reference/status-->
					<xsl:value-of select="status"/>
				</p>
			</td>
			<td width="15%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: UseCase/Reference/impact-->
					<xsl:value-of select="impact"/>
				</p>
			</td>
			<td width="15%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: UseCase/Reference/orginiatorOrganisation-->
					<xsl:value-of select="originatorOrganisation"/>
				</p>
			</td>
			<td width="15%" class="TableCell">
				<p class="MsoNormal">
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
				<td width="10%" class="TableCell">
					<!--LOOKUP: UseCase/technicalId-->
					<xsl:attribute name="id">
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
					
					<xsl:for-each select="RelatedUseCase">
						<p class="MsoNormal">
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
				<td width="10%" class="TableCell">
					<p class="MsoNormal">
						<!--LOOKUP: UseCase/levelOfDepth-->
						<xsl:value-of select="levelOfDepth"/>
					</p>
				</td>
				<td width="10%" class="TableCell">
					<p class="MsoNormal">
						<!--LOOKUP: UseCase/prioritisation-->
						<xsl:value-of select="prioritisation"/>
					</p>
				</td>
				<td width="10%" class="TableCell">
					<p class="MsoNormal">
						<!--LOOKUP: UseCase/classification-->
						<xsl:value-of select="classification"/>
					</p>
				</td>
				<td width="10%" class="TableCell">
					<p class="MsoNormal">
						<!--LOOKUP: UseCase/nature-->
						<xsl:value-of select="nature"/>
					</p>
				</td>
				<td width="10%" class="TableCell">
					<p class="MsoNormal">
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
			<td width="5%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: UseCase/Scenario/technicalId-->
					<xsl:attribute name="id">
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
					
					<!--LOOKUP: UseCase/Scenario/identifier-->
					<xsl:value-of select="identifier"/>
				</p>
			</td>
			<td width="18%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: UseCase/Scenario/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
			<td width="18%" class="TableCell">
				<!--LOOKUP: UseCase/Scenario/PrimaryCPS-->
				<xsl:for-each select="PrimaryCPS">
					<p class="MsoNormal">
						<!--LOOKUP: PrimaryCPS/technicalId-->
						<xsl:attribute name="id">
							<xsl:value-of select="technicalId"/>
						</xsl:attribute>
						
						<!--LOOKUP: PrimaryCPS/name-->
						<xsl:value-of select="name"/>
					</p>
				</xsl:for-each>
			</td>
			<td width="18%" class="TableCell">
				<!--LOOKUP: UseCase/Scenario/TriggeringEvent-->
				<xsl:for-each select="TriggeringEvent">
					<p class="MsoNormal">
						<!--LOOKUP: TriggeringEvent/name & TriggeringEvent/content-->
						<xsl:value-of select="concat(name, ': ', content)"/>
					</p>
				</xsl:for-each>
			</td>
			<td width="18%" class="TableCell">
				<!--LOOKUP: UseCase/Scenario/Precondition-->
				<xsl:for-each select="Precondition">
					<p class="MsoNormal">
						<!--LOOKUP: Precondition/name & Precondition/description-->
						<xsl:value-of select="concat(name, ': ', content)"/>
					</p>
				</xsl:for-each>
			</td>
			<td width="18%" class="TableCell">
				<!--LOOKUP: UseCase/Scenario/Postcondition-->
				<xsl:for-each select="Postcondition">
					<p class="MsoNormal">
						<!--LOOKUP: Postcondition/name & Postcondition/description-->
						<xsl:value-of select="concat(name, ': ', content)"/>
					</p>
				</xsl:for-each>
			</td>
			<td width="5%" class="TableCell">
				<p class="MsoNormal">
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
			<span lang="EN-GB" xml:lang="EN-GB">
				<p>
					<!--LOOKUP: Scenario/technicalId-->
					<xsl:attribute name="id">
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
				
					<!--LOOKUP: Scenario/name-->
					<xsl:text>Steps - </xsl:text>
					<xsl:value-of select="name"/>
				</p>
			</span>
		</h2>
		
		<table id="4.1">
			<tr>
				<td width="100%" colspan="9" class="TableHeader">
					<p class="TableHeading"><span lang="EN-GB" xml:lang="EN-GB">Scenario</span></p>
				</td>
			</tr>
			<tr>
				<td width="13%" colspan="2" class="TableHeader">
					<p class="TableHeading"><span lang="EN-GB" xml:lang="EN-GB">Scenario Name :</span></p>
				</td>
				<td width="86%" colspan="7" class="TableCell">
					<p class="MsoNormal">
						<!--LOOKUP: Scenario/name-->
						<xsl:value-of select="name"/>
					</p>
				</td>
			</tr>
			<tr style="height:12.55pt">
				<td width="6%" class="TableHeader">
					<p class="TableHeading"><span lang="EN-GB" xml:lang="EN-GB">Step No.</span></p>
				</td>
				<td width="7%" class="TableHeader">
					<p class="TableHeading"><span lang="EN-GB" xml:lang="EN-GB">Event</span></p>
				</td>
				<td width="12%" class="TableHeader">
					<p class="TableHeading"><span lang="EN-GB" xml:lang="EN-GB">Name of Process/ Activity</span></p>
				</td>
				<td width="13%" class="TableHeader">
					<p class="TableHeading"><span lang="EN-GB" xml:lang="EN-GB">Description of Process/ Activity</span></p>
				</td>
				<td width="9%" class="TableHeader">
					<p class="TableHeading"><span lang="EN-GB" xml:lang="EN-GB">Service</span></p>
					<p class="TableHeading"><span lang="EN-GB" xml:lang="EN-GB"/></p>
				</td>
				<td width="12%" class="TableHeader">
					<p class="TableHeading"><span lang="EN-GB" xml:lang="EN-GB">Information Producer (Actor)</span></p>
				</td>
				<td width="12%" class="TableHeader">
					<p class="TableHeading"><span lang="EN-GB" xml:lang="EN-GB">Information Receiver (Actor)</span></p>
				</td>
				<td width="13%" class="TableHeader">
					<p class="TableHeading"><span lang="EN-GB" xml:lang="EN-GB">Information Exchanged</span></p>
				</td>
				<td width="12%" class="TableHeader">
					<p class="TableHeading"><span lang="EN-GB" xml:lang="EN-GB">Requirements , R-ID</span></p>
				</td>
			</tr>
			
			<xsl:apply-templates select="MacroActivity"/>

		</table>
		
		<xsl:call-template name="GenerateAspectsTableFromGreatGrandparentId">
			<xsl:with-param name="id" select="'4.1.1'"/>
			<xsl:with-param name="parentName" select="'Step'"/>
			<xsl:with-param name="greatGrandparentId" select="generate-id(.)"/>
		</xsl:call-template>
	</xsl:template>
	
	<!--Ouptut sub tables for a MacroActivity.-->
	<xsl:template match="MacroActivity">
		<tr id="MacroActivity">
			<td colspan="9" class="TableHeader">
				<p class="TableHeading">
					<xsl:attribute name="id">
						<!--LOOKUP: MacroActivity/technicald-->
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
				
					<!--LOOKUP: Macroactivity/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
		</tr>
	
		<xsl:apply-templates select="Step"/>
	</xsl:template>
	
	<!--Output table for a Step-->
	<xsl:template match="Step">
		<tr style="height:9.2pt">
			<td width="6%" class="TableCell">
				<p class="MsoNormal">
					<xsl:attribute name="id">
						<!--LOOKUP: Step/technicalId-->
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
				
					<!--LOOKUP: Step/identifier-->
					<xsl:value-of select="identifier"/>
				</p>
			</td>
			<td width="7%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: Step/event-->
					<xsl:value-of select="event"/>
				</p>
			</td>
			<td width="12%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: Step/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
			<td width="13%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: Step/description-->
					<xsl:value-of select="description"/>
				</p>
			</td>
			<td width="9%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: Step/service-->
					<xsl:value-of select="service"/>
				</p>
			</td>
			<td width="12%" class="TableCell">
				<xsl:for-each select="InformationProducer">
					<p class="MsoNormal">
						<!--LOOKUP: Step/InformationProducer/technicalId-->
						<xsl:attribute name="id">
							<xsl:value-of select="technicalId"/>
						</xsl:attribute>
						
						<!--LOOKUP: Step/InformationProducer/name-->
						<xsl:value-of select="name"/>
					</p>
				</xsl:for-each>
			</td>
			<td width="12%" class="TableCell">
				<xsl:for-each select="InformationReceiver">
					<p class="MsoNormal">
						<!--LOOKUP: Step/InformationReceiver/technicalId-->
						<xsl:attribute name="id">
							<xsl:value-of select="technicalId"/>
						</xsl:attribute>
						
						<!--LOOKUP: Step/InformationReceiver/name-->
						<xsl:value-of select="name"/>
					</p>
				</xsl:for-each>
			</td>
			<td width="13%" class="TableCell">
				<xsl:for-each select="BusinessObject">
					<p class="MsoNormal">
						<!--LOOKUP: Step/BusinessObject/technicalId-->
						<xsl:attribute name="id">
							<xsl:value-of select="technicalId"/>
						</xsl:attribute>
						
						<!--LOOKUP: Step/BusinessObject/name-->
						<xsl:value-of select="name"/>
					</p>
				</xsl:for-each>
			</td>
			<td width="12%" class="TableCell">
				<p class="MsoNormal">
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
			<td width="20%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: InformationModel/technicalId-->
					<xsl:attribute name="id">
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
				
					<!--LOOKUP: InformationModel/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
			<td width="40%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: InformationModel/description-->
					<xsl:value-of select="description"/>
				</p>
			</td>
			<td width="30%" class="TableCell">
				<xsl:for-each select="Requirement">
					<p class="MsoNormal">
						<!--LOOKUP: InformationModel/Requirement-->
						<xsl:value-of select="technicalId"/>
						
						<xsl:if test="position() &lt; last()">
							<xsl:text>,</xsl:text>
						</xsl:if>
					</p>
				</xsl:for-each>
			</td>
			<td width="10%" class="TableCell">
				<p class="MsoNormal">
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
			<td width="20%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: Maturity/effective-->
					<xsl:value-of select="effective"/>
				</p>
			</td>
			<td width="20%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: Maturity/maurity-->
					<xsl:value-of select="maturity"/>
				</p>
			</td>
			<td width="20%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: Maturity/responsibleParty-->
					<xsl:value-of select="responsibleParty"/>
				</p>
			</td>
			<td width="20%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: Maturity/revision-->
					<xsl:value-of select="revision"/>
				</p>
			</td>
			<td width="20%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: Maturity/status-->
					<xsl:value-of select="status"/>
				</p>
			</td>
		</tr>
	</xsl:template>

	<!--Outputs influence table row.-->
	<xsl:template match="influence">
		<tr>
			<td width="20%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: influence/technicalId-->
					<xsl:attribute name="id">
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
					
					<!--LOOKUP: influence/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
			<td width="70%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: influence/description-->
					<xsl:value-of select="description"/>
				</p>
			</td>
			<td width="10%" class="TableCell">
				<p class="MsoNormal">
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
			<td width="20%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: message/technicalId-->
					<xsl:attribute name="id">
						<xsl:value-of select="technicalId"/>
					</xsl:attribute>
					
					<!--LOOKUP: message/name-->
					<xsl:value-of select="name"/>
				</p>
			</td>
			<td width="70%" class="TableCell">
				<p class="MsoNormal">
					<!--LOOKUP: message/description-->
					<xsl:value-of select="description"/>
				</p>
			</td>
			<td width="10%" class="TableCell">
				<p class="MsoNormal">
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
		
		<h2>
			<span lang="EN-GB" xml:lang="EN-GB">Requirements</span>
		</h2>
		<table id="{$id}">
			<tr style="height:10.75pt">
				<td width="100%" colspan="2" class="TableHeader">
					<p class="TableHeading">
						<span lang="EN-GB" xml:lang="EN-GB">Requirements</span>
					</p>
				</td>
			</tr>
			
			<tr style="height:10.75pt">
				<td width="5%" class="TableHeader">
					<p class="TableHeading">
						<span lang="EN-GB" xml:lang="EN-GB">R-ID</span>
					</p>
				</td>
				<td width="95%" class="TableHeader">
					<p class="TableHeading">
						<span lang="EN-GB" xml:lang="EN-GB">Details</span>
					</p>
				</td>
			</tr>
			
			<xsl:apply-templates select="$AspectLookupTable/lookup:entry[@parentName = $parentName and @grandparentId = $grandparentId]"/>
			
		</table>
	</xsl:template>
	
	<!--Generates an aspect table with the Aspects that match the given id, parentName, and greatgrandparentId.
		This is necessary for outputing aspect tables for steps in the right locations.-->
	<xsl:template name="GenerateAspectsTableFromGreatGrandparentId">
		<xsl:param name="id"/>
		<xsl:param name="parentName"/>
		<xsl:param name="greatGrandparentId"/>
		
		<h2>
			<span lang="EN-GB" xml:lang="EN-GB">Requirements</span>
		</h2>
		<table id="{$id}">
			<tr style="height:10.75pt">
				<td width="100%" colspan="2" class="TableHeader">
					<p class="TableHeading">
						<span lang="EN-GB" xml:lang="EN-GB">Requirements</span>
					</p>
				</td>
			</tr>
			
			<tr style="height:10.75pt">
				<td width="5%" class="TableHeader">
					<p class="TableHeading">
						<span lang="EN-GB" xml:lang="EN-GB">R-ID</span>
					</p>
				</td>
				<td width="95%" class="TableHeader">
					<p class="TableHeading">
						<span lang="EN-GB" xml:lang="EN-GB">Details</span>
					</p>
				</td>
			</tr>
			
			<xsl:apply-templates select="$AspectLookupTable/lookup:entry[@parentName = $parentName and @greatGrandparentId = $greatGrandparentId]">
				<xsl:with-param name="useGrandparentNumber" select="true()"/>
			</xsl:apply-templates>
			
		</table>
	</xsl:template>

	<!--This template generates rows for the Requirements table based on the entries in the AspectLookupTable variable.-->
	<xsl:template match="lookup:entry">
		<xsl:param name="useGrandparentNumber" select="false()"/>
		<tr>
			<td width="5%" class="TableCell" style="vertical-align: middle;">
				<p class="MsoNormal" style="text-align: center;">
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
			<td width="95%" class="TableCell">
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
					<td width="5%" class="TableHeader">
						<p class="TableHeading">
							<span lang="EN-GB" xml:lang="EN-GB">Description</span>
						</p>
					</td>
					<td width="95%" class="TableCell">
						<p class="MsoNormal">
							<xsl:value-of select="description"/>
						</p>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="priority">
				<tr>
					<td width="5%" class="TableHeader">
						<p class="TableHeading">
							<span lang="EN-GB" xml:lang="EN-GB">Priority</span>
						</p>
					</td>
					<td width="95%" class="TableCell">
						<p class="MsoNormal">
							<xsl:value-of select="priority"/>
						</p>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="reference">
				<tr>
					<td width="5%" class="TableHeader">
						<p class="TableHeading">
							<span lang="EN-GB" xml:lang="EN-GB">References</span>
						</p>
					</td>
					<td width="95%" class="TableCell">
						<p class="MsoNormal">
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
					<td width="5%" class="TableHeader">
						<p class="TableHeading">
							<span lang="EN-GB" xml:lang="EN-GB">Statement</span>
						</p>
					</td>
					<td width="95%" class="TableCell">
						<p class="MsoNormal">
							<xsl:value-of select="statement"/>
						</p>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="trace">
				<tr>
					<td width="5%" class="TableHeader">
						<p class="TableHeading">
							<span lang="EN-GB" xml:lang="EN-GB">Trace</span>
						</p>
					</td>
					<td width="95%" class="TableCell">
						<p class="MsoNormal">
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
