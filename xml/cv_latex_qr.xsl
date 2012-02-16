<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns="http://www.w3.org/1999/xhtml">
<xsl:output method="text" encoding="UTF-8"/>

<xsl:variable name="techUsed"><xsl:apply-templates select="/cv/techUsed"/></xsl:variable>
<xsl:variable name="tools"><xsl:apply-templates select="/cv/tools"/></xsl:variable>
<xsl:variable name="obj"><xsl:apply-templates select="/cv/obj"/></xsl:variable>
<xsl:variable name="space">5.5em</xsl:variable>
<xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />

<xsl:template match="cv"  >%% start of file `template.tex'.
%% Copyright 2006-2010 Xavier Danaux (xdanaux@gmail.com).
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License version 1.3c,
% available at http://www.latex-project.org/lppl/.

\documentclass[11pt,<xsl:apply-templates select="lang"/>]{article}%
\usepackage[utf8]{inputenc}                   % replace by the encoding you are using
\usepackage[scale=0.8]{geometry}%
\usepackage{pst-barcode}
\usepackage{auto-pst-pdf}

\definecolor{color0}{rgb}{0,0,0}% black
\definecolor{color1}{HTML}{<xsl:apply-templates select="color"/>}% light blue
\definecolor{color2}{rgb}{0.45,0.45,0.45}% dark grey

\begin{document}%
MECARD:N:<xsl:apply-templates select="profile/surname"/>,<xsl:apply-templates select="profile/name"/>;TEL:<xsl:value-of select="translate(profile/phone,' ','')"/>;EMAIL:<xsl:apply-templates select="profile/mail"/>;URL:<xsl:apply-templates select="update/@site"/>;;

\begin{pspicture}(64pt,64pt)
\psbarcode[fillstyle=solid,linecolor=color1]{MECARD:N:<xsl:apply-templates select="profile/surname"/>,<xsl:apply-templates select="profile/name"/>;TEL:<xsl:value-of select="translate(profile/phone,' ','')"/>;EMAIL:<xsl:apply-templates select="profile/mail"/>;URL:<xsl:apply-templates select="update/@site"/>;;}
{eclevel=L height=1 width=1}{qrcode}
\end{pspicture}
\end{document}
</xsl:template>

<xsl:template match="strong">\textbf{<xsl:apply-templates/>}</xsl:template>

<xsl:template match="newline">\newline{} </xsl:template>

<xsl:template match="sharp">\#</xsl:template>

<xsl:template match="euro">\euro{}</xsl:template>

<xsl:template match="amp">\&amp;</xsl:template>

<xsl:template match="nbsp">~</xsl:template>

<xsl:template match="link">\href{<xsl:value-of select="@href"/>}{<xsl:apply-templates/>}</xsl:template>

<xsl:template match="*/text()"><xsl:value-of select="."/></xsl:template>

</xsl:stylesheet>
