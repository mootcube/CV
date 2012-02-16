<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns="http://www.w3.org/1999/xhtml">
<xsl:output method="text" encoding="UTF-8"/>

<xsl:variable name="techUsed"><xsl:apply-templates select="/cv/techUsed"/></xsl:variable>
<xsl:variable name="tools"><xsl:apply-templates select="/cv/tools"/></xsl:variable>
<xsl:variable name="obj"><xsl:apply-templates select="/cv/obj"/></xsl:variable>
<xsl:variable name="space">-0.5em</xsl:variable>
<xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />

<xsl:template match="cv"  >%% start of file `template.tex'.
%% Copyright 2006-2010 Xavier Danaux (xdanaux@gmail.com).
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License version 1.3c,
% available at http://www.latex-project.org/lppl/.

\documentclass[11pt,a4paper,<xsl:apply-templates select="lang"/>]{moderncv}%
<!--%\documentclass[11pt,a4paper,pdfcenterwindow,pdffitwindow,pdftoolbar=false,pdfmenubar=false,pdfpagelayout=OneColumn]{moderncv}
-->\usepackage[pdftex]{hyperref}%
<xsl:choose>
	<xsl:when test="lang = 'fr'">%\usepackage[francais]{babel}%</xsl:when>
	<xsl:otherwise></xsl:otherwise>
</xsl:choose>
\usepackage[none]{hyphenat}%
\usepackage{eurosym}%
% character encoding
\usepackage[utf8]{inputenc}                   % replace by the encoding you are using
% adjust the page margins
\usepackage[scale=0.8]{geometry}%
%\usepackage{pstool}

\pdfminorversion=7%
\pdfobjcompresslevel=3%

\hypersetup{%
  pdftitle={<xsl:apply-templates select="profile/name"/>~<xsl:apply-templates select="profile/surname"/> -- <xsl:apply-templates select="title"/>},%
}%

% moderncv themes
\moderncvtheme{classic}                 % optional argument are 'blue' (default), 'orange', 'red', 'green', 'grey' and 'roman' (for roman fonts, instead of sans serif fonts)<!--
%\moderncvtheme[green]{classic}                % idem

-->

\definecolor{color0}{rgb}{0,0,0}% black
\definecolor{color1}{HTML}{<xsl:apply-templates select="color"/>}% light blue
\definecolor{color2}{rgb}{0.45,0.45,0.45}% dark grey

\setlength{\hintscolumnwidth}{2.5cm}						%3 if you want to change the width of the column with the dates
\AtBeginDocument{\setlength{\maketitlenamewidth}{8cm}}  %12cm only for the classic theme, if you want to change the width of your name placeholder (to leave more space for your address details
\AtBeginDocument{\recomputelengths}                     % required when changes are made to page layout lengths

% personal data
\firstname{<xsl:apply-templates select="profile/name"/>}%
\familyname{<xsl:value-of select="translate(profile/surname, $smallcase, $uppercase)"/>}%
\title{<xsl:apply-templates select="profile/title"/>}%\newline{}\large{<xsl:apply-templates select="profile/field"/>}}               % optional, remove the line if not wanted
\address{\Writinghand~<xsl:apply-templates select="profile/address/street"/>}{<xsl:apply-templates select="profile/address/cp"/>}    % optional, remove the line if not wanted
\mobile{<xsl:apply-templates select="profile/phone"/>}                    % optional, remove the line if not wanted<!--
%\phone{+33 9 70 44 82 89}                      % optional, remove the line if not wanted
%\fax{fax (optional)}                          % optional, remove the line if not wanted-->
\email{<xsl:apply-templates select="profile/mail"/>}                      % optional, remove the line if not wanted
\homepage{<xsl:apply-templates select="update/@site"/>}                % optional, remove the line if not wanted
%\extrainfo{Age <xsl:apply-templates select="profile/age"/>\\<xsl:apply-templates select="profile/drive"/>} % optional, remove the line if not wanted
\photo[64pt]{qr-pics}                         % '64pt' is the height the picture must be resized to and 'picture' is the name of the picture file; optional, remove the line if not wanted
\quote{<xsl:apply-templates select="profile/field"/>}%\huge Recherche d'emploi \small\\~\\ \Large Ingénieur Junior dans les nouvelles technologies}%
<!--
% to show numerical labels in the bibliography; only useful if you make citations in your resume
\makeatletter%
\renewcommand*{\bibliographyitemlabel}{\@biblabel{\arabic{enumiv}}}%
\makeatother%

% bibliography with mutiple entries
%\usepackage{multibib}
%\newcites{book,misc}{{Books},{Others}}
-->
%\nopagenumbers{}                             % uncomment to suppress automatic page numbering for CVs longer than one page
%----------------------------------------------------------------------------------
%            content
%----------------------------------------------------------------------------------
\pagestyle{fancy}%



\renewcommand*{\namefont}{\fontsize{26}{36}\sffamily\mdseries\upshape}%
%\renewcommand*{\namefont}{\fontsize{34}{36}\sffamily\mdseries\upshape}%

\begin{document}%
%\fancypagestyle{plain}{%
\fancyfoot[c]{\color{color2}\addressfont\upshape Mis~à~jour~le~pouet Mon~site~pour~la~dernière~version~:~<xsl:apply-templates select="update/@site"/>}%}% the parbox is required to ensure alignment with a possible center footer (e.g., as in the casual style)
\maketitle%
%\vspace{-1.5em}%
<xsl:apply-templates select="section"/>
<!--
%\renewcommand{\listitemsymbol}{-} % change the symbol for lists

%\section{Extra 2}
%\cvlistdoubleitem{Item 1}{Item 4}
%\cvlistdoubleitem{Item 2}{Item 5 \cite{book1}}
%\cvlistdoubleitem{Item 3}{}

% Publications from a BibTeX file without multibib\renewcommand*{\bibliographyitemlabel}{\@biblabel{\arabic{enumiv}}}% for BibTeX numerical labels
%\nocite{*} 
%\bibliographystyle{plain}
%\bibliography{publications}       % 'publications' is the name of a BibTeX file

% Publications from a BibTeX file using the multibib package
%\section{Publications}
%\nocitebook{book1,book2}
%\bibliographystylebook{plain}
%\bibliographybook{publications}   % 'publications' is the name of a BibTeX file
%\nocitemisc{misc1,misc2,misc3}
%\bibliographystylemisc{plain}
%\bibliographymisc{publications}   % 'publications' is the name of a BibTeX file
-->

<!--
\begin{pspicture}(64pt,64pt)
\psbarcode{MECARD:N:<xsl:apply-templates select="profile/surname"/>,<xsl:apply-templates select="profile/name"/>;TEL:<xsl:apply-templates select="profile/phone"/>;EMAIL:<xsl:apply-templates select="profile/mail"/>;URL:<xsl:apply-templates select="update/@site"/>;;}
{eclevel=L height=1 width=1}{qrcode}
\end{pspicture}
-->
<!--
\begin{pspicture}(2cm,2cm)
	\obeylines
	\psbarcode{%
BEGIN:VCARD
VERSION:4.0
N:CHATAIGNER;Mathieu;;M.;
FN:M. Mathieu CHATAIGNER
NAME:CHATAIGNER
TEL;PREF=1;TYPE="work,cell";VALUE=uri:tel:+33684858322
ADR:;;1 rue de la garenne;Salouel;;80480;France
EMAIL:mathieu.chataigner@gmail.com
URL:http://mathieu.chataigner.pro/
END:VCARD
}{eclevel=L width=2 height=2}{qrcode}%
\end{pspicture}
-->

<!--\begin{pspicture}(1in,1in)
	\obeylines
	\psbarcode{%
BEGIN:VCARD^^J
VERSION:3.0^^J
N:Barczynski;Wojciech^^J
FN:Wojciech Barczynski^^J
ORG:^^J
URL:http://wbarczynski.org^^J
EMAIL;TYPE=INTERNET:wbarczynski@gmail.com^^J
TEL;TYPE=voice,work,pref:+49 00000000^^J
ADR;TYPE=intl,work,postal,parcel:;;STREET NAME;CITY;;POST CODE;Germany^^J
END:VCARD
}{width=0.9 height=0.9}{qrcode}%
\end{pspicture}
-->

\end{document}


%% end of file `template_en.tex'.
% LocalWords:  Cranfield Institut des Appliquées de Rouen Auchan Villeneuve XSL
% LocalWords:  d'Ascq SharePoint Javascript EE ORI OAI MySQL PostgreSQL RMI PHP
% LocalWords:  CORBA TCP IP DNS TOEIC Inline XHTML CSS MSc



</xsl:template>

<xsl:template match="section">
\section{<xsl:apply-templates select="@title"/>}%<xsl:apply-templates/>%
</xsl:template>

<xsl:template match="formation">\cventry{<xsl:apply-templates select="year"/>}{<xsl:apply-templates select="title"/>}{\href{<xsl:apply-templates select="web"/>}{<xsl:apply-templates select="school/text()"/><xsl:if test="school/schoollong"> (<xsl:apply-templates select="school/schoollong"/>)</xsl:if>}}{<xsl:apply-templates select="location"/>}{<xsl:apply-templates select="field"/>}{<xsl:if test="misc"><xsl:apply-templates select="misc"/>.</xsl:if>}  % arguments 3 to 6 can be left empty</xsl:template>

<xsl:template match="competence">\cvline{<xsl:apply-templates select="field"/>}{<xsl:apply-templates select="description"/><xsl:if test="tools">\newline{}<xsl:copy-of select="$tools"/> <xsl:apply-templates select="tools"/>.</xsl:if>}<!--\cventry{<xsl:value-of select="field"/>}{<xsl:apply-templates select="description"/>}{}{}{}{<xsl:if test="tools">\techUsed <xsl:value-of select="tools"/>.</xsl:if>}  % arguments 3 to 6 can be left empty
%\cvcomputer
%{<xsl:value-of select="field"/>}{<xsl:apply-templates/>}{}{}-->%</xsl:template>

<xsl:template match="experience">\cventry{<xsl:apply-templates select="year"/>} {<xsl:apply-templates select="title"/>} {\href{<xsl:apply-templates select="web"/>}{<xsl:apply-templates select="entreprise"/>}} {<xsl:apply-templates select="location"/>} {} {<xsl:copy-of select="$obj"/> <xsl:apply-templates select="description"/> <xsl:if test="tools">\newline{}<xsl:copy-of select="$techUsed"/> %Utilisation de 
<xsl:apply-templates select="tools"/>.</xsl:if>}%\vspace{0.9em}}%
\vspace{0.5em}%</xsl:template>

<xsl:template match="interest" >\cvline{<xsl:apply-templates select="field"/>}{\begin{minipage}[t]{\linewidth}\small{<xsl:apply-templates select="description"/>}\end{minipage}}%</xsl:template>

<xsl:template match="language" >\cvlanguage{<xsl:apply-templates select="name"/>}{<xsl:apply-templates select="level"/>}{<xsl:if test="description"><xsl:apply-templates select="description"/>.</xsl:if>\hfill}%</xsl:template>

<xsl:template match="project" >\cvline{<xsl:apply-templates select="title"/>}{\begin{minipage}[t]{\linewidth}\small{<xsl:apply-templates select="description"/><xsl:if test="tools">\newline{}<xsl:copy-of select="$techUsed"/> <xsl:apply-templates select="tools"/>.</xsl:if>}\end{minipage}}%\vspace{0.3em}}%</xsl:template>

<xsl:template match="strong">\textbf{<xsl:apply-templates/>}</xsl:template>

<xsl:template match="newline">\newline{} </xsl:template>

<xsl:template match="sharp">\#</xsl:template>

<xsl:template match="euro">\euro{}</xsl:template>

<xsl:template match="amp">\&amp;</xsl:template>

<xsl:template match="nbsp">~</xsl:template>

<xsl:template match="link">\href{<xsl:value-of select="@href"/>}{<xsl:apply-templates/>}</xsl:template>

<xsl:template match="*/text()"><xsl:value-of select="."/></xsl:template>

</xsl:stylesheet>
