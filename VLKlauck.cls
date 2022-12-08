\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{VLKlauck}[2007/09/13 Vorlesungen Klauck HTW Aalen]

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{beamer}%
}
\ProcessOptions\relax
\ProcessOptions

\pdfminorversion=4

\LoadClass{beamer}

\RequirePackage{pgf}

% Zeichensatz (UTF-8), deutsche Rechtschreibung, Anführungszeichen
\RequirePackage{ucs} 					% extended UTF-8 input encoding
\RequirePackage[utf8x]{inputenc} 			% Sonderzeichen direkt eingeben
\RequirePackage[T1]{fontenc} 				% bestimmte Schrifttypen laden
\RequirePackage[english,ngerman]{babel} 	% Silbentrennung nach neuer deutscher Rechtschreibung
\RequirePackage[babel,german=quotes]{csquotes} 	% deutsche Anführungszeichen
\RequirePackage{lmodern}
\RequirePackage{gensymb}
\RequirePackage{newunicodechar}
\newunicodechar{°}{\degree}

\selectlanguage{ngerman}

% Serifenlose Schrift
\renewcommand*\familydefault{\sfdefault}

% http://texdoc.net/texmf-dist/doc/latex/koma-script/scrguide.pdf
% http://www.namsu.de/Extra/pakete/Lmodern.html

% Diverses
%\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor} 	% Farben
%\RequirePackage[dvipsnames]{xcolor} 	% Farben
%\RequirePackage[protrusion=true,expansion=true]{microtype} 		% Typografie-Verbesserung
\RequirePackage{xspace} 									% Abstand-Verbesserung
%\RequirePackage[onehalfspacing]{setspace} 					% Zeilenabstand
%\RequirePackage{blindtext} 									% Blindtext generieren
\RequirePackage{boxedminipage}
%\RequirePackage{lastpage}
%\RequirePackage{geometry}
\RequirePackage{lscape}
\RequirePackage{marvosym}
\RequirePackage{rotating}
\RequirePackage{textcomp}

% --- Mathematik
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amstext}
\RequirePackage{mathtools}
%\RequirePackage{stmaryrd}
\RequirePackage{trfsigns} 
\RequirePackage{nicefrac}
\RequirePackage{siunitx}
%\RequirePackage{MnSymbol}

\newcommand{\field}[1]{\mathbb{#1}}
\newcommand{\C}{\field{C}}
\newcommand{\R}{\field{R}}

% --- Grafik
\RequirePackage{graphics}
\RequirePackage{graphicx}
\RequirePackage{pdflscape}
\RequirePackage{pgffor}
\RequirePackage{pgfplots}
\RequirePackage{subfigure}

% tikz, siehe http://www.texample.net/tikz/
%\RequirePackage{tikz}
%\usetikzlibrary{matrix,positioning,arrows,shapes,snakes,arrows}


% --- Tabellen
\RequirePackage{longtable}      % seitenuebergreifende Tabellen
\RequirePackage{tabularx}
\RequirePackage{multicol}
\RequirePackage{multirow}

\RequirePackage{booktabs}	% Hochwertige horizontale Linien in Tabellen
%\RequirePackage{soul}		% Textauszeichnungen 
\RequirePackage{array}          	% fuer aufwaendigere Tabellen
\RequirePackage{colortbl}       	% farbige Tabellen (v. D. Carlisle)

% Zitate, Inhaltsverzeichnis, Index
\RequirePackage{cite}
\RequirePackage{makeidx}
\RequirePackage{tocbasic}

% Nummerierung
%\RequirePackage{enumerate}
%\RequirePackage{paralist}

% Algorithmen und Quellcode

\RequirePackage[formats]{listings}
\RequirePackage{algpseudocode}
\RequirePackage{struktex}
\RequirePackage{filecontents}
\RequirePackage{forloop}
\RequirePackage{ifthen}
\RequirePackage{cancel}


\newcommand{\LComment}[1]{$\blacktriangleright\,$\textit{#1}}%
\newcommand{\SComment}[1]{\State{$\blacktriangleright\,$\textit{#1}}}%
\algrenewcommand{\algorithmiccomment}[1]{\hfill$\blacktriangleright\,$ #1}
   
\lstloadlanguages{[ISO]C++,[ANSI]C++,R,Java,Python}   %%%,C++,[ISO]C++,[ANSI]C++}

\lstset{
	inputencoding=utf8x,
	extendedchars=\true,
%
	numbers=left,
	tabsize=2,
%
	captionpos=b,
	breaklines=true,
	breakatwhitespace=true,
	%prebreak=\raisebox{0ex}[0ex][0ex]{\color{gray}\ensuremath{\rhookswarrow}},
	%postbreak=\raisebox{0ex}[0ex][0ex]{\color{gray}\ensuremath{\rcurvearrowse\space}},
%
	xleftmargin=4ex,
	xrightmargin=0ex,
%
	showtabs=false,
	showspaces=false,
	showstringspaces=false,
%
	basicstyle=\ttfamily\color{black}\scriptsize,
	keywordstyle=\ttfamily\color{blue},
	stringstyle=\ttfamily\color{blue},
	commentstyle=\ttfamily\color{gray},
	numberstyle=\ttfamily\color{gray},
	identifierstyle=\ttfamily\color{black},
	%directivestyle=\ttfamily\color{red},
	morekeywords={},
	literate=%
		{Ö}{{\"O}}1 
		{Ä}{{\"A}}1 
		{Ü}{{\"U}}1 
		{ß}{{\ss}}2 
		{ü}{{\"u}}1 
		{ä}{{\"a}}1 
		{ö}{{\"o}}1
}

\lstdefinelanguage{R}{% https://stat.ethz.ch/pipermail/r-help/2006-September/113688.html
	morekeywords=[1]{\<<-},%
	sensitive=false,
	morecomment=[l]{\#},
	morecomment=[s]{/*}{*/},
	morestring=[b]",
}[keywords,comments,strings]

\lstdefinelanguage{CSS}{
	morekeywords={color,display},
	sensitive=false,
	morecomment=[l]{//},
	morecomment=[s]{/*}{*/},
	morestring=[b]",
}

\lstdefinelanguage{C}{%%
%	morekeywords={color,display},
	sensitive=false,
	morecomment=[l]{//},
	morecomment=[s]{/*}{*/},
	morestring=[b]"
}

\lstdefinestyle{IPython}{%%
	%%morekeywords={>>>},
	frame=single,
	backgroundcolor=\color{verylightgray},
	numbers=none,
	xleftmargin=0ex,
	basicstyle=\ttfamily\color{black}\scriptsize,
	keywordstyle=\ttfamily\color{black},
	stringstyle=\ttfamily\color{black},
	commentstyle=\ttfamily\color{gray},
	numberstyle=\ttfamily\color{black},
	identifierstyle=\ttfamily\color{black},
	%directivestyle=\ttfamily\color{red},
}

\pgfdeclareimage[height=0.5cm]{htw-logo}{master-300-png}
\logo{\pgfuseimage{htw-logo}}

% ------------------------------------------------------------------------------------------

\mode<presentation>
{
%\usetheme{HtwAalen}
\useoutertheme{default}
\usecolortheme{whale}
\setbeamercovered{invisible}
}

\mode<handout> % 1 Folie auf einem Blatt, Seiten nummeriert
{
\setbeamercolor{titlelike}{fg=black, bg=white}
\setbeamertemplate{footline}
{
  \leavevmode%
  \hbox{%
  \begin{beamercolorbox}[wd=.1\paperwidth,ht=2.25ex,dp=1ex,left]{bg}%
    \usebeamerfont{pagenumber in head/foot}
    \insertpagenumber{} %%/ \inserttotalframenumber\hspace*{2ex} 
  \end{beamercolorbox}%
%
}%
  \vskip0pt%
}
}

\mode<handoutxx> % 4 Folien auf einem Blatt, Seiten nicht nummeriert
{
	\usepackage{pgfpages}
	\pgfpagesuselayout{4 on 1}[a4paper,landscape,border shrink=5mm]
}

\mode<handoutxx> % 4 Folien auf einem Blatt, Seiten nummeriert
{
 \usepackage{pgfpages}
\pgfpagesuselayout{4 on 1}[a4paper,landscape,border shrink=5mm]
\setbeamertemplate{footline}
{
  \leavevmode%
  \hbox{%
  \begin{beamercolorbox}[wd=.1\paperwidth,ht=2.25ex,dp=1ex,left]{bg}%
    \usebeamerfont{pagenumber in head/foot}
    \insertpagenumber{} %%/ \inserttotalframenumber\hspace*{2ex} 
  \end{beamercolorbox}%
%
}%
  \vskip0pt%
}


}


\mode<handoutxx> % 2 Folien auf einem Blatt, Seite nummeriert
{
 \usepackage{pgfpages}
% \pgfpagesuselayout{2 on 1}[a4paper,landscape,border shrink=5mm, center=\pgfpoint{.5\pgfphysicalwidth}{.5\pgfphysicalheight}]

\pgfpagesuselayout{2 on 1}[a4paper,landscape,border shrink=5mm, center=\pgfpoint{.5\pgfphysicalwidth}{.5\pgfphysicalheight}]

\pgfpageslogicalpageoptions{1}
{%
resized width=.5\pgfphysicalwidth,%
resized height=.5\pgfphysicalheight,%
border shrink=\pgfpageoptionborder,%
center=\pgfpoint{.25\pgfphysicalwidth}{.75\pgfphysicalheight}%
}%
\pgfpageslogicalpageoptions{2}
{%
resized width=.5\pgfphysicalwidth,%
resized height=.5\pgfphysicalheight,%
border shrink=\pgfpageoptionborder,%
center=\pgfpoint{.75\pgfphysicalwidth}{.75\pgfphysicalheight}%
}% 

\setbeamertemplate{footline}
{
  \leavevmode%
  \hbox{%
  \begin{beamercolorbox}[wd=.1\paperwidth,ht=2.25ex,dp=1ex,left]{bg}%
    \usebeamerfont{pagenumber in head/foot}
    \insertpagenumber{} %%/ \inserttotalframenumber\hspace*{2ex} 
  \end{beamercolorbox}%
%
}%
  \vskip0pt%
}
}

\mode<handoutxx> % 2 Folien auf einem Blatt, Seite nicht nummeriert
{
 \usepackage{pgfpages}
% \pgfpagesuselayout{2 on 1}[a4paper,landscape,border shrink=5mm, center=\pgfpoint{.5\pgfphysicalwidth}{.5\pgfphysicalheight}]

\pgfpagesuselayout{2 on 1}[a4paper,landscape,border shrink=5mm, center=\pgfpoint{.5\pgfphysicalwidth}{.5\pgfphysicalheight}]

\pgfpageslogicalpageoptions{1}
{%
resized width=.5\pgfphysicalwidth,%
resized height=.5\pgfphysicalheight,%
border shrink=\pgfpageoptionborder,%
center=\pgfpoint{.25\pgfphysicalwidth}{.75\pgfphysicalheight}%
}%
\pgfpageslogicalpageoptions{2}
{%
resized width=.5\pgfphysicalwidth,%
resized height=.5\pgfphysicalheight,%
border shrink=\pgfpageoptionborder,%
center=\pgfpoint{.75\pgfphysicalwidth}{.75\pgfphysicalheight}%
}% 
}


\newcommand{\newframe}[1]
{
\begin{frame}[allowframebreaks,fragile]
#1
\end{frame}
}

\newcommand{\referenz}[1]
{
\begin{tiny}
#1
\end{tiny}
}

\renewcommand{\em}[1]{{\usebeamercolor[fg]{block title} #1}}
\renewcommand{\emph}[1]{{\usebeamercolor[fg]{block title} #1}}

%\setlength{\parsep}{1ex}
\setlength{\parskip}{1ex}
\setcounter{tocdepth}{2}

\AtBeginSection[]
{
  \begin{frame}<beamer>[allowframebreaks]
    \frametitle{\contentsname}
    \tableofcontents[currentsection, hideallsubsections]
  \end{frame}

  \begin{frame}<handout>[allowframebreaks]
    \frametitle{\contentsname}
    \tableofcontents[currentsection]
   \end{frame}
}


\AtBeginSubsection[]
{
  \begin{frame}<beamer>[allowframebreaks]
    \frametitle{\contentsname}
    \tableofcontents[currentsubsection, sections={\thesection}]
   \end{frame}

  \begin{frame}<handout>[allowframebreaks]
    \frametitle{\contentsname}
    \tableofcontents[currentsubsection]
   \end{frame}
}


