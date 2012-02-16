<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns="http://www.w3.org/1999/xhtml">
<xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="yes"/>

<xsl:variable name="techUsed"><xsl:apply-templates select="/cv/techUsed"/></xsl:variable>
<xsl:variable name="tools"><xsl:apply-templates select="/cv/tools"/></xsl:variable>
<xsl:variable name="obj"><xsl:apply-templates select="/cv/obj"/></xsl:variable>
<xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />

<xsl:template match="cv"  >

<html xmlns="http://www.w3.org/1999/xhtml">
	<xsl:attribute name="xml:lang"><xsl:apply-templates select="lang"/></xsl:attribute>
	<xsl:attribute name="lang"><xsl:apply-templates select="lang"/></xsl:attribute>
	<head>
		<title><xsl:apply-templates select="title"/> - <xsl:apply-templates select="profile/name"/><xsl:text> </xsl:text><xsl:value-of select="translate(profile/surname, $smallcase, $uppercase)"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" ><xsl:attribute name="xml:lang"><xsl:apply-templates select="lang"/></xsl:attribute><xsl:attribute name="lang"><xsl:apply-templates select="lang"/></xsl:attribute></meta>
		<meta http-equiv="Content-Language" ><xsl:attribute name="content"><xsl:apply-templates select="lang"/></xsl:attribute></meta>
		<meta name="robots" content="All" />
		<meta name="description" ><xsl:attribute name="content"><xsl:apply-templates select="description"/></xsl:attribute></meta>
		<meta name="keywords" ><xsl:attribute name="xml:lang"><xsl:apply-templates select="lang"/></xsl:attribute><xsl:attribute name="lang"><xsl:apply-templates select="lang"/></xsl:attribute><xsl:attribute name="content"><xsl:apply-templates select="keywords"/></xsl:attribute></meta>
		<meta name="reply-to"  ><xsl:attribute name="content"><xsl:apply-templates select="replyto"/></xsl:attribute></meta>
		<meta name="distribution" content="global" />
		<meta name="author" ><xsl:attribute name="xml:lang"><xsl:apply-templates select="lang"/></xsl:attribute><xsl:attribute name="lang"><xsl:apply-templates select="lang"/></xsl:attribute><xsl:attribute name="content"><xsl:apply-templates select="author"/></xsl:attribute></meta>
		<meta name="copyright"  ><xsl:attribute name="content"><xsl:apply-templates select="copyright"/></xsl:attribute></meta>
		<!-- copyright mathieu CHATAIGNER, please send me a message if you want to use this template-->
		<meta name="identifier-url"  ><xsl:attribute name="content"><xsl:apply-templates select="update/@site"/></xsl:attribute></meta>
		<meta name="expires" content="never" />
		<meta name="Date-Creation-yyyymmdd"  ><xsl:attribute name="content"><xsl:apply-templates select="creationDate/y"/>/<xsl:apply-templates select="creationDate/m"/>/<xsl:apply-templates select="creationDate/d"/></xsl:attribute></meta>
		<meta name="Date-Revision-yyyymmdd"  ><xsl:attribute name="content"><xsl:apply-templates select="modificationDate/y"/>/<xsl:apply-templates select="modificationDate/m"/>/<xsl:apply-templates select="modificationDate/d"/></xsl:attribute></meta>
		<meta name="viewport" content="width=device-width" />
		<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
		<link rel="stylesheet" type="text/css" media="all" href="css/common.css"/>
		<link rel="stylesheet" type="text/css" media="screen and (min-device-width: 1024px)" href="css/style.css"/>
		<link rel="stylesheet" type="text/css" media="print" href="css/print.css"/>
		<link rel="stylesheet" type="text/css" media="(min-device-width: 320px) and (max-device-width: 1023px)" href="css/handheld.css"/>
		<style media="all">
			.colored,#content h2,.head{color:#<xsl:apply-templates select="color"/>;}
		</style>
		<style media="print">
			.bgcolored{color:#<xsl:apply-templates select="color"/><!--819FF7-->;}
		</style>
		<style media="screen and (min-device-width: 1024px)">
			.bgcolored{color:#FFFFFF;background-color:#<xsl:apply-templates select="color"/>;}
			a{color:#<xsl:apply-templates select="color"/>;}
			a:hover,a:focus {color:#<xsl:apply-templates select="color"/>; }
		</style>
		<style media="(min-device-width: 320px) and (max-device-width: 1023px)">
			.bgcolored{color:#FFFFFF;background-color:#<xsl:apply-templates select="color"/>;}
			a{color:#<xsl:apply-templates select="color"/>;}
			a:hover,a:focus {color:#<xsl:apply-templates select="color"/>; }
		</style>
	</head>
	<body>
		<!--[if lte IE 6]>
		<style type="text/css">
		body{text-align:center;}
		#cv{margin-left:30px; margin-right:30px; width:100%;}
		#conteneur{width:800px; display:inline; text-align:left;}
		</style>
		<![endif]-->
		<!--script type="text/javascript">

		  var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', 'UA-24574529-1']);
		  _gaq.push(['_trackPageview']);

		  (function() {
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();

		</script-->
		<!--  <xsl:apply-templates select=""/>  -->
		
		<div id="outConteneur">
			<div id="conteneur">
				<div id="entete" class="block left right bgcolored">
					<div class="enteteBlock">
						<div id="enteteLeft" class="entete left">
							<h1><xsl:apply-templates select="profile/name"/><xsl:text> </xsl:text><xsl:value-of select="translate(profile/surname, $smallcase, $uppercase)"/></h1>
							<h2><xsl:apply-templates select="profile/title"/></h2>
							<h3><xsl:apply-templates select="profile/field"/></h3>
						</div>
						<div id="enteteRight" class="entete right">
							<ul id="info">
								<li><address><xsl:apply-templates select="profile/address/street"/><br/><xsl:apply-templates select="profile/address/cp"/></address></li>
								<li><xsl:apply-templates select="profile/phone"/></li>
								<li><xsl:apply-templates select="profile/mail"/></li>
								<!--li><a><xsl:attribute name="href">mailto:<xsl:apply-templates select="profile/mail"/></xsl:attribute><xsl:apply-templates select="profile/mail"/></a></li-->
								<li>Age : <xsl:apply-templates select="profile/age"/></li>
								<li><xsl:apply-templates select="profile/drive"/></li>
							</ul>
						</div>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
				<div id="divtitle" class="block left right">
					<h1 id="title" class="center colored"></h1><!--RECHERCHE D'EMPLOI</h1>
					<h1 id="subtitle" class="center">Ingénieur Junior dans les nouvelles technologies.</h1-->
				</div>
				<div class="clear"></div>
				<div id="content" class="block left right">
					<xsl:apply-templates select="section"/>
					<div class="clear"></div>
					<div class="footer innerBlock">
						Mis à jour le <xsl:apply-templates select="modificationDate/d"/>/<xsl:apply-templates select="modificationDate/m"/>/<xsl:apply-templates select="modificationDate/y"/><br/>Mon site internet pour la dernière version : <a><xsl:attribute name="href"><xsl:apply-templates select="update/@site"/></xsl:attribute><xsl:apply-templates select="update/@site"/></a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
			<div style="margin:0;padding:0;display:none;visibility:hidden"><h1>Mathieu CHATAIGNER, Mathieu CHATAIGNIER CHATIAGNER CHATIAGNIER</h1></div>
		</div>
	</body>
</html>
</xsl:template>

















<xsl:template match="formation">
							<div>
								<div class="head"><xsl:apply-templates select="year"/></div>
								<div class="data">
									<p>
										<xsl:apply-templates select="title"/>, <a ><xsl:attribute name="href"><xsl:apply-templates select="web"/></xsl:attribute><xsl:apply-templates select="school/text()"/><xsl:if test="school/schoollong"> (<xsl:apply-templates select="school/schoollong"/>)</xsl:if></a>, <xsl:apply-templates select="location"/>.
									</p>
									<p>
										<xsl:apply-templates select="field"/>.
									</p>
									<xsl:if test="misc"><p>
										<xsl:apply-templates select="misc"/>.
									</p></xsl:if>
								</div>
								<div class="clear"></div>
							</div>
</xsl:template>

<xsl:template match="competence">
							<div>
								<div class="head"><xsl:apply-templates select="field"/></div>
								<div class="data">
									<p><xsl:apply-templates select="description"/></p>
									<xsl:if test="tools"><!--br/--><p><xsl:copy-of select="$tools"/> <xsl:apply-templates select="tools"/>.</p></xsl:if>
								</div>
								<div class="clear"></div>
							</div>
</xsl:template>

<xsl:template match="language">
							<div>
								<div class="head"><xsl:apply-templates select="name"/></div>
								<div class="data">
									<p><xsl:apply-templates select="level"/>
									<xsl:if test="description"> (<xsl:apply-templates select="description"/>)</xsl:if>.</p>
								</div>
								<div class="clear"></div>
							</div>
							<!--tr>
								<th><xsl:apply-templates select="name"/></th>
								<td><p>
									<p><xsl:apply-templates select="level"/>
									<xsl:if test="description"> (<xsl:apply-templates select="description"/>)</xsl:if>.</p>
								</p></td>
							</tr-->
</xsl:template>


<xsl:template match="experience">
							<div>
								<div class="head"><xsl:apply-templates select="year"/></div>
								<div class="data">
									<p><span class="subject">
									<xsl:choose>
									<xsl:when test="titleweb">
										<a>
											<xsl:attribute name="href">
												<xsl:apply-templates select="titleweb"/>
											</xsl:attribute>
											<xsl:apply-templates select="title"/>
										</a>
									</xsl:when>
									<xsl:otherwise>
										<xsl:apply-templates select="title"/>
									</xsl:otherwise>
									</xsl:choose>
									</span>, <span class="address"><a href="http://www.cranfield.ac.uk/"><xsl:attribute name="href"><xsl:apply-templates select="web"/></xsl:attribute><xsl:apply-templates select="entreprise"/></a></span>, <xsl:apply-templates select="location"/>.</p><!--br/--><p><xsl:apply-templates select="description"/></p>
									<xsl:if test="tools"><!--br/--><p><xsl:copy-of select="$techUsed"/> <xsl:apply-templates select="tools"/>.</p></xsl:if>
								</div>
								<div class="clear"></div>
							</div>
</xsl:template>

<xsl:template match="interest" >
							<div>
								<div class="head"><xsl:apply-templates select="field"/></div>
								<div class="data"><p><xsl:apply-templates select="description"/></p></div>
								<div class="clear"></div>
							</div>
</xsl:template>

<xsl:template match="p">
<xsl:apply-templates select="."/><br/>
</xsl:template>

<xsl:template match="project" >
							<div>
								<div class="head"><xsl:apply-templates select="title"/></div>
								<div class="data"><p><xsl:apply-templates select="description"/></p>
								<xsl:if test="tools"><!--br/--><p><xsl:copy-of select="$techUsed"/> <xsl:apply-templates select="tools"/>.</p></xsl:if>
								</div>
								<div class="clear"></div>
							</div>
</xsl:template>

<xsl:template match="section">
					<div class="innerBlock">
						<h2><a name="projets"></a><xsl:apply-templates select="@title"/></h2>
							<xsl:apply-templates/>
					</div>
</xsl:template>

<xsl:template match="strong"><span class="subject"><xsl:apply-templates/></span></xsl:template>

<xsl:template match="newline"><br/></xsl:template>

<xsl:template match="sharp">#</xsl:template>
<xsl:template match="euro">€</xsl:template>
<xsl:template match="amp">&amp;</xsl:template>
<xsl:template match="nbsp">&#160;</xsl:template>

<xsl:template match="link"><a style="white-space:nowrap;"><xsl:attribute name="href"><xsl:apply-templates select="@href"/></xsl:attribute><xsl:apply-templates/></a></xsl:template>

<xsl:template match="*/text()"><xsl:value-of select="."/></xsl:template>

</xsl:stylesheet>
