%%-*- LaTeX -*-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ausarbeitung.cls
%
% Klassendatei fuer Projektarbeiten, Bachelorarbeiten, Masterarbeiten, Praxisberichte
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title:			ausarbeitung.cls
% Author:			Ulrich Klauck, Manuel Blum (HTW Aalen)
% Credits to:		Matthias Müller <matthias.mueller@htw-aalen.de>, Prof. Dr. J. Schiefer
% Modifiied by:    
% Date:			2008/12/4
% Last Rev.:		2016/09/16
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Identify the class.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Ausarbeitung}[2008/07/02 Ausarbeitung HTW Aalen]

\PassOptionsToClass{%
	12pt, % Schriftgröße [10pt, 11pt, 12pt]
	a4paper, % Papierformat [a4paper, a5paper, b5paper, letterpaper, legalpaper]
	onecolumn, % Ein- oder zweispaltig [onecolumn, twocolumn]
	final, % Entwurf oder finale Version [draft, final]
	ngerman, % neue deutsche Rechtschreibung
	reqno, % Nummer bei Formeln links statt rechts [leqno, reqno]
	fleqn, % Formeln linksbündig [fleqn]
	twoside, % ein- oder zweiseitig [oneside, twoside]
	openright, % wo Kapitel beginnen [openright, openany]
	parskip=2ex   % half*,
	headings=big
}{scrbook}

% Default option---pass to scrbook.cls, since that is the base.
\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{scrbook}%
}

\ProcessOptions\relax

% Load the base class and required packages.
\LoadClassWithOptions{scrbook}

% ---------------------------------------------------------------------------------

\RequirePackage{ucs}
\RequirePackage[utf8x]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[ngerman, english]{babel}
\RequirePackage[babel, german=quotes]{csquotes}

\RequirePackage{lmodern}   % lmodern, times, ...
\renewcommand*\familydefault{\sfdefault}    % serifenlose Schrift


% Überprüfen, ob notwendig
\RequirePackage[automark]{scrlayer-scrpage}
\RequirePackage{calc}
\RequirePackage{array}
\RequirePackage{newcent}
\RequirePackage{setspace}  

\RequirePackage{blindtext}  
  
\RequirePackage{placeins}
\RequirePackage{float}
\RequirePackage[final,colorlinks=false]{hyperref}
% --- Ende der zu überprüfenden Liste
% ----------------------------------------------

% Grafik

\RequirePackage{graphics}
\RequirePackage{graphicx}
\RequirePackage{pgf}
\RequirePackage{caption}[2008/08/24]
\RequirePackage{subcaption}
%\RequirePackage{subfigure}


% Mathe

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amstext}
\RequirePackage{amsthm}
\RequirePackage{mathtools}
\RequirePackage{nicefrac}
\RequirePackage{siunitx}

% Algorithmen und Quellcode

\RequirePackage[formats]{listings}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{struktex}
\RequirePackage{filecontents}
\RequirePackage{forloop}
\RequirePackage{ifthen}
\RequirePackage{cancel}

% Tabellen

\RequirePackage{longtable}
\RequirePackage{tabularx}
\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage{booktabs}

% Ein paar Symbole

\RequirePackage{gensymb}
\RequirePackage{newunicodechar}
\newunicodechar{°}{\degree}
\RequirePackage{marvosym}

% Indizes
\RequirePackage{makeidx}\makeindex

\RequirePackage{geometry}%
\geometry{%
a4paper,%
inner=35mm,%
top=35mm,%
textwidth=150mm,%
textheight=235mm,%
marginparwidth=35mm,%
marginparsep=5mm,%
headheight=10mm,%
headsep=18mm,%
footskip=16mm,%
columnsep=6mm,%
ignoreall}

% ---------------------------------------------------------------------------------

\lstloadlanguages{R,Java,Python,[ISO]C++,[ANSI]C++,[ANSI]C}

\lstset{
	inputencoding=utf8x,
	extendedchars=\true,
%
	numbers=left,
	tabsize=3,
	stepnumber=1,
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
	stringstyle=\ttfamily\color{green},
	commentstyle=\ttfamily\color{orange},
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


% Error information should be more than the default.
\setcounter{errorcontextlines}{5}

% ---------------------------------------------------------------------------------
% Pagestyle

\pagestyle{scrheadings} 
\clearscrheadfoot
\ihead{\headmark}
\ohead{\pagemark}
\raggedbottom

%\onehalfspacing % Zeilenabstand: 1,5
\setlength\parskip{2ex}


% ---------------------------------------------------------------------------------
% Titel

\def\@depurl{http://www.htw-aalen.de/studium/in/}
\def\depurl#1{\def\@depurl{#1}}

\def\@depname{Informatik}
\def\depname#1{\def\@depname{#1}}

\newcommand{\departmentaddress}{Informatik}
\newcommand{\depuniversity}{Hochschule Aalen}

%\def\@doctype{}%
\def\doctype#1{\def\@doctype{#1}}%

%\def\@examinerA{}
\def\examinerA#1{\def\@examinerA{#1}}%

%\def\@examinerB{}
\def\examinerB#1{\def\@examinerB{#1}}%

\def\@datetext{Einreichungsdatum}
\def\datetext#1{\def\@datetext{#1}}

\renewcommand\maketitle{\begin{titlepage}%
	\sffamily
	\begin{flushright}
		\includegraphics[width=.75\textwidth]{images/htw-aalen.pdf}
	\end{flushright}
	\vskip 2cm
	\begin{flushleft}
		\par \large \color{gray}
		\ifx\@doctype\undefined%
%
		\else%
		\@doctype\\%
		Studiengang\xspace\@depname\xspace\\[0ex]%
		\fi%
		\par \rule{\textwidth}{0.25pt}
		\ifx\@author\undefined%
%
		\else%
		\par \Large \color{black} 
		\@author%
		\fi%
	\end{flushleft}
%
	\bigskip
	\bigskip
	\bigskip
	\begin{center}
		\ifx\@title\undefined%
		%
		\else
		\par\Huge\@title%
		\fi%
	\end{center}
	\vfill
%
%
	\begin{tabular}{ll}
		\ifx\@examinerA\undefined
		\else
		Prüfer:		& \@examinerA \\
		\fi
		\ifx\@examinerB\undefined
		\else
		Zweitprüfer:	& \@examinerB \\
		\fi
		\ifx\@date\undefined
		\else
		& \\
		\@datetext	& \@date \\
		\fi
	\end{tabular}
\end{titlepage}
}


% --------------------------------------------------------------------------------------------------
%
% Übernahmen aus AKAD

\newcounter{kf}%
\newenvironment{Kontrollfrage}[2][\z@]{%
\refstepcounter{kf}%
\par\medskip\noindent\textbf{Kontrollfrage \thekf}\\[1ex]%
}%
{\par\smallskip\ignorespacesafterend}%
	
\newcounter{ka}%
\newenvironment{Kontrollantwort}[2][\z@]{%
\refstepcounter{ka}%
\par\smallskip\noindent\textbf{Kontrollantwort \theka}\\[1ex]
}%
{\par\medskip\ignorespacesafterend}%

\newenvironment{Teilzusammenfassung}[1]{%
\noindent\textbf{Teilzusammenfassung }\\[1ex]%
}{}

\newenvironment{Beispiel}[1]{%
\par\medskip\noindent\textbf{Beispiel } \\[1ex]%
}{}

\newcommand{\Einleitung}{\noindent\textbf{Einleitung}}
\newcommand{\Antwortteil}{\noindent\textbf{Antwortteil}}
\newcommand{\Zusammenfassung}{\noindent\textbf{Zusammenfassung}}

\newcommand{\kontrollfrage}[1]{
\begin{Kontrollfrage}
{}#1
\end{Kontrollfrage}
}


