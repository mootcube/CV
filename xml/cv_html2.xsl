<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="yes"/>

  <xsl:variable name="techUsed"><xsl:apply-templates select="/cv/techUsed"/></xsl:variable>
  <xsl:variable name="tools"><xsl:apply-templates select="/cv/tools"/></xsl:variable>
  <xsl:variable name="obj"><xsl:apply-templates select="/cv/obj"/></xsl:variable>
  <xsl:variable name="updateText"><xsl:apply-templates select="/cv/misc/updateText"/></xsl:variable>
  <xsl:variable name="siteLink"><xsl:apply-templates select="/cv/misc/siteLink"/></xsl:variable>
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
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
	
	<link href="css/bootstrap.min.css" rel="stylesheet" />
	<!--link href="css/bootstrap-responsive.css" rel="stylesheet" /-->
	<link href="css/docs2.css" rel="stylesheet" />
	
	
      </head>
      <body  data-spy="scroll" data-target=".bs-docs-sidebar">
	
	<script src="js/jquery-1.8.2.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	<script src="js/application.js"/>
	
	<!--script type="text/javascript">
	  $('#navbar').affix()
	</script-->
	
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
	
	
	<!-- Navbar
	     ================================================== -->
	<div class="navbar navbar-inverse navbar-fixed-top">
	  <div class="navbar-inner">
            <div class="container">
              <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
              </button>
              <a class="brand" href="./cv.html">CV</a>
              <div class="nav-collapse collapse">
		<ul class="nav">
		  <li class="active">
                    <a href="./cv.html">Curriculum Vitae</a>
		  </li>
		  <xsl:apply-templates select="socials"/>
		</ul>
              </div>
            </div>
	  </div>
	</div>
	
	<header class="jumbotron subhead" id="overview">
	  <div class="container">
	    <div class="row">
	      <div class="span9">
		<h1><xsl:apply-templates select="profile/name"/><xsl:text> </xsl:text><xsl:apply-templates select="profile/surname"/></h1>
		<p class="lead"><xsl:apply-templates select="profile/title"/></p>
	      </div>
	      <div class="span3">
		<ul id="info" class="unstyled">
		  <li><address><xsl:apply-templates select="profile/address/street"/><br/><xsl:apply-templates select="profile/address/cp"/></address></li>
		  <li><xsl:apply-templates select="profile/phone"/></li>
		  <li><xsl:apply-templates select="profile/mail"/></li>
		  <!--li><a><xsl:attribute name="href">mailto:<xsl:apply-templates select="profile/mail"/></xsl:attribute><xsl:apply-templates select="profile/mail"/></a></li-->
		  <li>Age : <xsl:apply-templates select="profile/age"/></li>
		  <li><xsl:apply-templates select="profile/drive"/></li>
		</ul>
	      </div>
	    </div>
	  </div>
	</header>
	
	<div class="container">
	  <div class="row">
	    <div class="span3 bs-docs-sidebar hidden-phone">
              <ul class="nav nav-list bs-docs-sidenav affix">
		<xsl:for-each select="section">
		  <li><a><xsl:attribute name="href">#<xsl:value-of select="translate(@title,translate(@title,'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',''),'')" /></xsl:attribute><i class="icon-chevron-right"></i> <xsl:value-of select="@title" /></a></li>
		</xsl:for-each>
              </ul>
	    </div>
	    <div class="span9">
	      <xsl:apply-templates select="section"/>
	    </div>
	  </div>
	</div>
	
	<footer class="footer">
	  <div class="container">
	    <div class="row">
	      <div class="span3"/>
	      <div class="span9">
		<xsl:copy-of select="$updateText"/><xsl:apply-templates select="modificationDate/d"/>/<xsl:apply-templates select="modificationDate/m"/>/<xsl:apply-templates select="modificationDate/y"/><br/><xsl:copy-of select="$siteLink"/> : <a><xsl:attribute name="href"><xsl:apply-templates select="update/@site"/></xsl:attribute><xsl:apply-templates select="update/@site"/></a>
	      </div>
	    </div>
	    <div class="row" style="margin-top:10px;">
	      <div class="span12 pagination-centered">
		MeCard: <br/><img width="130px" src="temp/cv.png" />
	      </div>
	      <div style="margin:0;padding:0;display:none;visibility:hidden"><h1>Mathieu CHATAIGNER, Mathieu CHATAIGNIER CHATIAGNER CHATIAGNIER</h1></div>
	    </div>
	  </div>
	</footer>
</body>
</html>
</xsl:template>









<xsl:template match="socials">
  <xsl:for-each select="social">
    <li class="visible-desktop">
      <a><xsl:attribute name="href"><xsl:value-of select="text()"/></xsl:attribute><img width="25px" height="25px"><xsl:attribute name="src"><xsl:value-of select="@img"/></xsl:attribute><xsl:attribute name="alt"><xsl:value-of select="@name"/></xsl:attribute></img></a>
    </li>
  </xsl:for-each>
</xsl:template>


<xsl:template match="formation">
  
  <dt><xsl:apply-templates select="year"/></dt>
  <dd>
  <!--div class="data"-->
  <!--p-->
    <xsl:apply-templates select="title"/>, <a ><xsl:attribute name="href"><xsl:apply-templates select="web"/></xsl:attribute><xsl:apply-templates select="school/text()"/><xsl:if test="school/schoollong"> (<xsl:apply-templates select="school/schoollong"/>)</xsl:if></a>, <xsl:apply-templates select="location"/>.
  <!--/p-->
  <xsl:if test="field">
    <!--p-->
      <xsl:apply-templates select="field"/>.
    <!--/p-->
  </xsl:if>
  <xsl:if test="misc">
    <!--p-->
      <xsl:apply-templates select="misc"/>.
    <!--/p-->
  </xsl:if>
  <!--/div-->
  </dd>
</xsl:template>

<xsl:template match="competence">
  <!--div-->
  <dt><xsl:apply-templates select="field"/></dt>
  <!--div class="data"-->
  <dd>
    <p><xsl:apply-templates select="description"/></p>
    <xsl:if test="tools"><p><xsl:copy-of select="$tools"/> <xsl:apply-templates select="tools"/>.</p></xsl:if>
  </dd>
  <!--/div-->
  <!--/div-->
</xsl:template>

<xsl:template match="language">
  <div>
    <h3><xsl:apply-templates select="name"/></h3>
    <div class="data">
      <p><xsl:apply-templates select="level"/>
      <xsl:if test="description"> (<xsl:apply-templates select="description"/>)</xsl:if>.</p>
    </div>
  </div>
</xsl:template>


<xsl:template match="experience">
  <div>
    <h3><xsl:apply-templates select="year"/></h3>
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
	</span>, <span class="address"><a href="http://www.cranfield.ac.uk/"><xsl:attribute name="href"><xsl:apply-templates select="web"/></xsl:attribute><xsl:apply-templates select="entreprise"/></a></span>, <xsl:apply-templates select="location"/>.</p><p><xsl:apply-templates select="description"/></p>
	<xsl:if test="tools"><p><xsl:copy-of select="$techUsed"/> <xsl:apply-templates select="tools"/>.</p></xsl:if>
    </div>
  </div>
</xsl:template>

<xsl:template match="interest" >
  <div>
    <h3><xsl:apply-templates select="field"/></h3>
    <div class="data"><p><xsl:apply-templates select="description"/></p></div>
  </div>
</xsl:template>

<xsl:template match="p">
  <xsl:apply-templates select="."/><br/>
</xsl:template>

<xsl:template match="project" >
  <div>
    <h3><xsl:apply-templates select="title"/></h3>
    <div class="data"><p><xsl:apply-templates select="description"/></p>
    <xsl:if test="tools"><p><xsl:copy-of select="$techUsed"/> <xsl:apply-templates select="tools"/>.</p></xsl:if>
    </div>
  </div>
</xsl:template>

<xsl:template match="section[@short]">
  <section>
    <xsl:attribute name="id"><xsl:value-of select="translate(@title,translate(@title,'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',''),'')" /></xsl:attribute>
    <div class="page-header">
      <h1 ><xsl:apply-templates select="@title"/></h1>
    </div>
    <dl class="dl-horizontal">
      <xsl:apply-templates/>
    </dl>
  </section>
</xsl:template>

<xsl:template match="section">
  <section><xsl:attribute name="id"><xsl:value-of select="translate(@title,translate(@title,'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',''),'')" /></xsl:attribute>
  <div class="page-header">
    <h1 ><xsl:apply-templates select="@title"/></h1>
  </div>
  <xsl:apply-templates/>
  </section>
</xsl:template>

<xsl:template match="strong"><strong><xsl:apply-templates/></strong></xsl:template>

<xsl:template match="newline"><br/></xsl:template>

<xsl:template match="sharp">#</xsl:template>
<xsl:template match="euro">€</xsl:template>
<xsl:template match="amp">&amp;</xsl:template>
<xsl:template match="nbsp">&#160;</xsl:template>

<xsl:template match="link"><a style="white-space:nowrap;"><xsl:attribute name="href"><xsl:apply-templates select="@href"/></xsl:attribute><xsl:apply-templates/></a></xsl:template>

<xsl:template match="*/text()"><xsl:value-of select="."/></xsl:template>

</xsl:stylesheet>
