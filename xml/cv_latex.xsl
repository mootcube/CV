<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns="http://www.w3.org/1999/xhtml">
<xsl:output method="text" encoding="UTF-8"/>

<xsl:variable name="techUsed"><xsl:apply-templates select="/cv/techUsed"/></xsl:variable>
<xsl:variable name="tools"><xsl:apply-templates select="/cv/tools"/></xsl:variable>
<xsl:variable name="obj"><xsl:apply-templates select="/cv/obj"/></xsl:variable>
<xsl:variable name="space">-1.0em</xsl:variable>

<xsl:template match="cv"  >
<!-- <xsl:value-of select=""/> -->
%% start of file `template.tex'.
%% Copyright 2006-2010 Xavier Danaux (xdanaux@gmail.com).
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License version 1.3c,
% available at http://www.latex-project.org/lppl/.



\documentclass[11pt,a4paper,<xsl:apply-templates select="lang"/>]{moderncv}
%\documentclass[11pt,a4paper,pdfcenterwindow,pdffitwindow,pdftoolbar=false,pdfmenubar=false,pdfpagelayout=OneColumn]{moderncv}

%\topmargin 5cm

\usepackage[pdftex]{hyperref}
%\usepackage[francais]{babel}
\usepackage[none]{hyphenat}
\usepackage{eurosym}

\pdfminorversion=7
\pdfobjcompresslevel=3

\hypersetup{%
  pdftitle={<xsl:apply-templates select="profile/name"/> <xsl:apply-templates select="surname"/> -- <xsl:apply-templates select="title"/>},
}

% moderncv themes
\moderncvtheme[]{classic}                 % optional argument are 'blue' (default), 'orange', 'red', 'green', 'grey' and 'roman' (for roman fonts, instead of sans serif fonts)
%\moderncvtheme[green]{classic}                % idem

% character encoding
\usepackage[utf8]{inputenc}                   % replace by the encoding you are using

% adjust the page margins
%\usepackage[scale=0.9]{geometry}


\setlength{\hintscolumnwidth}{3cm}						% if you want to change the width of the column with the dates
\AtBeginDocument{\setlength{\maketitlenamewidth}{12cm}}  % only for the classic theme, if you want to change the width of your name placeholder (to leave more space for your address details
\AtBeginDocument{\recomputelengths}                     % required when changes are made to page layout lengths

% personal data
\firstname{<xsl:apply-templates select="profile/name"/>}
\familyname{<xsl:apply-templates select="profile/surname "/>}
\title{<xsl:apply-templates select="profile/title"/>\newline{}\large{<xsl:apply-templates select="profile/field"/>}}               % optional, remove the line if not wanted
\address{\Writinghand~<xsl:apply-templates select="profile/address/street"/>}{<xsl:apply-templates select="profile/address/cp"/>}    % optional, remove the line if not wanted
\mobile{<xsl:apply-templates select="profile/phone"/>}                    % optional, remove the line if not wanted
%\phone{+33 9 70 44 82 89}                      % optional, remove the line if not wanted
%\fax{fax (optional)}                          % optional, remove the line if not wanted
\email{<xsl:apply-templates select="profile/mail"/>}                      % optional, remove the line if not wanted
\homepage{<xsl:apply-templates select="update/@site"/>}                % optional, remove the line if not wanted
\extrainfo{Age <xsl:apply-templates select="profile/age"/>\\<xsl:apply-templates select="profile/drive"/>} % optional, remove the line if not wanted
%\photo[64pt]{picture}                         % '64pt' is the height the picture must be resized to and 'picture' is the name of the picture file; optional, remove the line if not wanted
%\quote{\huge Recherche d'emploi \small\\~\\ \Large Ingénieur Junior dans les nouvelles technologies}

% to show numerical labels in the bibliography; only useful if you make citations in your resume
\makeatletter
\renewcommand*{\bibliographyitemlabel}{\@biblabel{\arabic{enumiv}}}
\makeatother

% bibliography with mutiple entries
%\usepackage{multibib}
%\newcites{book,misc}{{Books},{Others}}

%\nopagenumbers{}                             % uncomment to suppress automatic page numbering for CVs longer than one page
%----------------------------------------------------------------------------------
%            content
%----------------------------------------------------------------------------------

\pagestyle{fancy}


\begin{document}

\maketitle
\vspace{-1.5em}

\section{<xsl:apply-templates select="formations/title"/>}
<xsl:apply-templates select="formations/formation"/>

\vspace{<xsl:copy-of select="$space"/>}
\section{<xsl:apply-templates select="competences/title"/>}% informatiques}

<xsl:apply-templates select="competences/competence"/>

\vspace{<xsl:copy-of select="$space"/>}
\section{<xsl:apply-templates select="languages/title"/>}

<xsl:apply-templates select="languages/language"/>

\vspace{<xsl:copy-of select="$space"/>}
\section{<xsl:apply-templates select="experiences/title"/>}

<xsl:apply-templates select="experiences/experience"/>

\vspace{<xsl:copy-of select="$space"/>}
\section{<xsl:apply-templates select="interests/title"/>}

<xsl:apply-templates select="interests/interest"/>

\vspace{<xsl:copy-of select="$space"/>}
\section{<xsl:apply-templates select="projects/title"/>}

<xsl:apply-templates select="projects/project"/>


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

\end{document}


%% end of file `template_en.tex'.
% LocalWords:  Cranfield Institut des Appliquées de Rouen Auchan Villeneuve XSL
% LocalWords:  d'Ascq SharePoint Javascript EE ORI OAI MySQL PostgreSQL RMI PHP
% LocalWords:  CORBA TCP IP DNS TOEIC Inline XHTML CSS MSc



</xsl:template>



<xsl:template match="formation">\cventry{<xsl:apply-templates select="year"/>}{<xsl:apply-templates select="title"/>}{\newline{}\href{<xsl:apply-templates select="web"/>}{<xsl:apply-templates select="school/text()"/><xsl:if test="school/schoollong"> (<xsl:apply-templates select="school/schoollong"/>)</xsl:if>}}{<xsl:apply-templates select="location"/>}{}{}  % arguments 3 to 6 can be left empty
</xsl:template>

<xsl:template match="competence">\cvline{\textbf{<xsl:apply-templates select="field"/>}}{<xsl:apply-templates select="description"/><xsl:if test="tools">\newline{}<xsl:copy-of select="$tools"/> <xsl:apply-templates select="tools"/>.</xsl:if>}
<!--\cventry{<xsl:value-of select="field"/>}{<xsl:apply-templates select="description"/>}{}{}{}{<xsl:if test="tools">\techUsed <xsl:value-of select="tools"/>.</xsl:if>}  % arguments 3 to 6 can be left empty
%\cvcomputer
%{<xsl:value-of select="field"/>}{<xsl:apply-templates/>}{}{}--></xsl:template>

<xsl:template match="experience">\cventry{<xsl:apply-templates select="year"/>} {<xsl:apply-templates select="title"/>} {\href{<xsl:apply-templates select="web"/>}{<xsl:apply-templates select="entreprise"/>}} {<xsl:apply-templates select="location"/>} {} {<xsl:copy-of select="$obj"/> <xsl:apply-templates select="description"/> <xsl:if test="tools">\newline{}<xsl:copy-of select="$techUsed"/> %Utilisation de 
<xsl:apply-templates select="tools"/>.</xsl:if>\vspace{0.9em}}%
</xsl:template>

<xsl:template match="interest" >\cvline{<xsl:apply-templates select="field"/>}{<xsl:apply-templates select="description"/>}%
</xsl:template>

<xsl:template match="language" >\cvlanguage{<xsl:apply-templates select="name"/>}{<xsl:apply-templates select="level"/>}{<xsl:if test="description"><xsl:apply-templates select="description"/>.</xsl:if>\hfill}%
</xsl:template>

<xsl:template match="project" >\cvline{\textbf{<xsl:apply-templates select="title"/>}}{\begin{minipage}[t]{\linewidth}\small{<xsl:apply-templates select="description"/><xsl:if test="tools">\newline{}<xsl:copy-of select="$techUsed"/> <xsl:apply-templates select="tools"/>.</xsl:if>}\end{minipage}\vspace{0.3em}}%
</xsl:template>

<xsl:template match="strong">\textbf{<xsl:apply-templates/>}</xsl:template>

<xsl:template match="newline">\newline{} </xsl:template>

<xsl:template match="sharp">\#</xsl:template>

<xsl:template match="euro">\euro{}</xsl:template>

<xsl:template match="amp">\&amp;</xsl:template>

<xsl:template match="link">\href{<xsl:value-of select="@href"/>}{<xsl:apply-templates/>}</xsl:template>

<xsl:template match="*/text()"><xsl:value-of select="."/></xsl:template>

</xsl:stylesheet>
