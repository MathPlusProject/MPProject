% This is a format for my notes

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mynote}[2025/11/09 mynotes document class]

% ------------------------------
% Options
% ------------------------------
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}

\SetupKeyvalOptions{family=MYNOTE,prefix=MYNOTE@,setkeys=\kvsetkeys}
\newcommand{\mkoption}[1]{\kvsetkeys{MYNOTE}{#1}}

% language options
\DeclareStringOption[cn]{lang}
\DeclareVoidOption{cn}{\mkoption{lang=cn}}
\DeclareVoidOption{en}{\mkoption{lang=en}}

\ProcessKeyvalOptions*\relax

\ifdefstring{\MYNOTE@lang}{cn}{
    \LoadClass[
    twoside,
    openany,
    fontset=windows
    %AutoFakeBold
    ]{ctexbook} % cn version
}{
    \LoadClass[
    twoside,
    openany,
    ]{book}    % en version
}

% ------------------------------
% Packages
% ------------------------------
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{mathrsfs}
\RequirePackage{tikz-cd}
\RequirePackage{tikz}
\RequirePackage{varwidth}
\RequirePackage{nicematrix}
\RequirePackage[
    notlot,
    notlof
]{tocbibind}
\RequirePackage[
    top = 3cm,
    bottom = 3cm,
    inner=2.54cm,
	outer=2.54cm,
	headheight=6ex,
	headsep=6ex,
	twoside,
	asymmetric,
    a4paper
]{geometry}
\RequirePackage{hyperref}
\RequirePackage{cleveref}
\RequirePackage{enumitem}
\RequirePackage{appendix}
\RequirePackage{makeidx}
\RequirePackage{graphicx}
\RequirePackage{fontspec}
\hypersetup{
    colorlinks = true,
    linkcolor = blue,
    citecolor = green,
    urlcolor = cyan
}
\RequirePackage{mymath}

% ------------------------------
% Custom commands
% ------------------------------
\newcommand{\termino}[1]{{\textit{#1}}} % Terminologies are written in italics

% Math settings
\everymath{\displaystyle}

\setcounter{MaxMatrixCols}{20}

% ------------------------------
% contents and section settings
% ------------------------------
\RequirePackage{titlesec}
\RequirePackage{titletoc}

\ifdefstring{\MYNOTE@lang}{cn}
{% cn version
    \ctexset{ 
        chapter = { 
        format += {\zihao{3}}, 
        name = {Chapter~,.}, 
        number = {\Roman{chapter}}
        }, 
        section = { 
        format += {\bfseries\raggedright\zihao{-3}}, 
        name = {\S,.}, 
        number = {\arabic{section}} 
        }, 
        subsection = { 
        format += {\bfseries\raggedright\zihao{-4}}, 
        name = {,.}, 
        number = {\arabic{section}.\arabic{subsection}} 
        }, 
        appendix = { 
        name = {Appendix~,.},
        number = {\Alph{chapter}}
        },
    }

    \titleformat{\section}[block]{\bfseries\raggedright\zihao{-3}}{\arabic{section}.}{1em}{} 

    \titleformat{\subsection}[runin]{\bfseries\raggedright\zihao{-4}}{\arabic{section}.\arabic{subsection}.}{0.5em}{}[.\vspace{0.5em}]

    \titlecontents{chapter}[0pt]{\vspace{1em}\large}{\thecontentslabel\hspace{1em}}{}{\hfill\contentspage}

    \titlecontents{section}[1.5em]{\vspace{0.5em}}{\thecontentslabel\hspace{1em}}{}{\hfill\contentspage}

    \titlecontents{subsection}[1.5em]{}{\thecontentslabel\hspace{1em}}{}{\hfill\contentspage}
}
{% en version
    \titleformat{\chapter}[block]{\normalfont\Large\bfseries\centering}{\Roman{chapter}.}{1em}{}[\vspace{0.5em}]

    \titleformat{\section}[block]{\normalfont\large\bfseries}{\arabic{section}.}{1em}{}[\vspace{0.5em}]
	
    \titleformat{\subsection}[runin]{\normalfont\bfseries\raggedright}{\arabic{section}.\arabic{subsection}.}{0.5em}{}[.]

    \renewcommand{\thechapter}{\Roman{chapter}}
    \titlecontents{chapter}[0pt]{\vspace{1em}\large}{Chapter~\thecontentslabel.\hspace{1em}}{}{\hfill\contentspage}

    \renewcommand{\thesection}{\arabic{section}}
    \titlecontents{section}[1.5em]{\vspace{0.5em}}{\S\thecontentslabel.\hspace{1em}}{}{\hfill\contentspage}

    \renewcommand{\thesubsection}{\arabic{subsection}.\arabic{subsubsection}}
    \titlecontents{subsection}[1.5em]{}{\thecontentslabel.\hspace{1em}}{}{\hfill\contentspage}

    \renewcommand{\appendix}{
    \par
    \setcounter{chapter}{0}%
    \setcounter{section}{0}%
    \renewcommand{\thechapter}{\Alph{chapter}}%
    % chapter title format
    \titleformat{\chapter}[block]{\normalfont\Large\bfseries\centering}        {Appendix~\thechapter.}{1em}{}[\vspace{0.5em}]
    \titlecontents{chapter}[0pt]{\vspace{1em}\large}{Appendix~\thecontentslabel.\hspace{1em}}{}{\hfill\contentspage}
    }
}   

% ------------------------------
% header and footer settings
% ------------------------------
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{%
	\markboth{\Roman{chapter}.~#1}{}
}
\renewcommand{\sectionmark}[1]{
	\markright{\arabic{section}.~#1}
}
\fancyhf{} % 
\fancyhead[LE,RO]{{\thepage}}
\fancyhead[RE]{\slshape\leftmark}
\fancyhead[LO]{\slshape\rightmark}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}

% ------------------------------
% settings of amsthm
% ------------------------------
\RequirePackage{amsthm}
\RequirePackage{xcolor}

% colors
\definecolor{rmkfr}{HTML}{39C5BB}%MIKU
\definecolor{thmfr}{HTML}{0077DD}%otae~
\definecolor{Rmkfr}{HTML}{FF5522}%kasumi kirakiradokidoki!
\definecolor{corfr}{HTML}{AA66DD}%arisa~
\definecolor{lemfr}{HTML}{FFCC11}%saaya~
\definecolor{propfr}{HTML}{FF55BB}%rimirin~
\definecolor{egfr}{HTML}{32CD32}
\definecolor{deffr}{HTML}{D82C2A}%Random Star

% Define theorem styles
\newcommand{\theoremendmark}{\hfill$\lrcorner$}

\newcommand{\newcoloredtheoremstyle}[3][\upshape]{%
    % #1 = body font (Default = \upshape, which is "Normal" upright text)
    % #2 = style name
    % #3 = color name
    \newtheoremstyle{#2}%
        {5pt}% space above
        {5pt}% space below
        {#1}% body font <--- Defaults to \upshape
        {2em}% indent amount
        {\color{#3}\bfseries}% head font
        {}% punctuation after theorem head
        {1em}% space after theorem head
        {}% theorem head spec
}

\newcoloredtheoremstyle[\itshape]{thmstyle}{thmfr}
\newcoloredtheoremstyle[\itshape]{lemstyle}{lemfr}
\newcoloredtheoremstyle[\itshape]{corstyle}{corfr}
\newcoloredtheoremstyle[\itshape]{propstyle}{propfr}
\newcoloredtheoremstyle{Rmkstyle}{Rmkfr}
\newcoloredtheoremstyle{egstyle}{egfr}
\newcoloredtheoremstyle{deffrstyle}{deffr}
\newcoloredtheoremstyle{rmkstyle}{rmkfr}

\theoremstyle{thmstyle}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{thmdef}[theorem]{Theorem-Definition}
\newtheorem{axiom}[theorem]{Axiom}

\theoremstyle{lemstyle}
\newtheorem{lemma}[theorem]{Lemma}

\theoremstyle{corstyle}
\newtheorem{corollary}[theorem]{Corollary}

\theoremstyle{propstyle}
\newtheorem{proposition}[theorem]{Proposition}

\theoremstyle{Rmkstyle}
\newtheorem{remark}[theorem]{Remark}

\theoremstyle{egstyle}
\newtheorem{example}[theorem]{Example}

\theoremstyle{deffrstyle}
\newtheorem{definition}[theorem]{Definition}

\theoremstyle{rmkstyle}
\newtheorem*{remarkstar}{\itshape Note:}

\newtheoremstyle{propstar}{5pt}{5pt}{\hangindent=4em \hangafter=0 \itshape}{}{\color{propfr}\bfseries}{}{1em}{}
\theoremstyle{propstar}
\newtheorem*{proposition*}{Proposition}

\newtheoremstyle{thmstar}{5pt}{5pt}{\hangindent=4em \hangafter=0 \itshape}{}{\color{thmfr}\bfseries}{}{1em}{}
\theoremstyle{thmstar}
\newtheorem*{theorem*}{Theorem}

\numberwithin{equation}{section}

% end mark for theorems
\AtEndEnvironment{theorem}{\theoremendmark}
\AtEndEnvironment{definition}{\theoremendmark}
\AtEndEnvironment{remark}{\theoremendmark}
\AtEndEnvironment{thmdef}{\theoremendmark}

% Reference commands
\newcommand{\thmref}[1]{\hyperref[#1]{Theorem~\ref{#1}}}
\newcommand{\propref}[1]{\hyperref[#1]{Proposition~\ref{#1}}}
\newcommand{\lemref}[1]{\hyperref[#1]{Lemma~\ref{#1}}}
\newcommand{\corref}[1]{\hyperref[#1]{Corollary~\ref{#1}}}
\newcommand{\defref}[1]{\hyperref[#1]{Definition~\ref{#1}}}
\newcommand{\thmdefref}[1]{\hyperref[#1]{Theorem-Definition~\ref{#1}}}
\newcommand{\axref}[1]{\hyperref[#1]{Axiom~\ref{#1}}}
\newcommand{\exref}[1]{\hyperref[#1]{Example~\ref{#1}}}
\newcommand{\rmkref}[1]{\hyperref[#1]{Remark~\ref{#1}}}
\newcommand{\lawref}[1]{\hyperref[#1]{Law~\ref{#1}}}
\newcommand{\Secref}[1]{\hyperref[#1]{\S\ref{#1}.}}
\newcommand{\secref}[1]{\hyperref[#1]{\ref{#1}.}}
\newcommand{\appref}[1]{\hyperref[#1]{Appendix~\ref{#1}}}
\newcommand{\pref}[1]{\hyperref[#1]{page~\pageref{#1}}}
\renewcommand{\eqref}[1]{\hyperref[#1]{(\ref{#1})}}

% rename proof environment
\renewcommand{\proofname}{Proof}

\makeatletter
\renewenvironment{proof}[1][\proofname]{%
  \par\pushQED{\qed}%
  \normalfont\topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep\itshape #1.]%
}{%
  \popQED\endtrivlist\@endpefalse
}
\makeatother

% The following commands have been moved into mymath.sty

%\newcommand{\defeq}{\mathrel{\coloneqq}}
%\newcommand{\eqdef}{\mathrel{\eqqcolon}}
%\newcommand{\defequiv}{\mathrel{\vcentcolon\Leftrightarrow}}

% mathbb commands
%\newcommand{\bbA}{\mathbb{A}}
%\newcommand{\bbB}{\mathbb{B}}
%\newcommand{\bbC}{\mathbb{C}}
%\newcommand{\bbD}{\mathbb{D}}
%\newcommand{\bbF}{\mathbb{F}}
%\newcommand{\bbN}{\mathbb{N}}
%\newcommand{\bbP}{\mathbb{P}}
%\newcommand{\bbQ}{\mathbb{Q}}
%\newcommand{\bbR}{\mathbb{R}}
%\newcommand{\bbZ}{\mathbb{Z}}

% mathbf commands
%\newcommand{\bfA}{\mathbf{A}}
%\newcommand{\bfG}{\mathbf{G}}
%\newcommand{\bfM}{\mathbf{M}}
%\newcommand{\bfV}{\mathbf{V}}

% mathrm commands
%\newcommand{\Ord}{\mathrm{Ord}}
%\newcommand{\IS}{\mathrm{IS}}
%\newcommand{\WIS}{\mathrm{WIS}}
%\newcommand{\succor}{\mathrm{succ}}
%\newcommand{\id}{\mathrm{id}}
%\newcommand{\Ob}{\mathrm{Ob}}
%\newcommand{\Hom}{\mathrm{Hom}}
%\newcommand{\End}{\mathrm{End}}
%\newcommand{\Aut}{\mathrm{Aut}}
%\newcommand{\Frob}{\mathrm{Frob}}
%\newcommand{\Spec}{\mathrm{Spec}}
%\newcommand{\coker}{\mathrm{coker}}
%\newcommand{\im}{\mathrm{im}}
%\newcommand{\coim}{\mathrm{coim}}
%\newcommand{\dom}{\mathrm{dom}}
%\newcommand{\ran}{\mathrm{ran}}
%\newcommand{\GL}{\mathrm{GL}}
%\newcommand{\Fct}{\mathrm{Fct}}
%\newcommand{\Ann}{\mathrm{Ann}}
%\newcommand{\ann}{\mathrm{ann}}
%\newcommand{\op}{\mathrm{op}}
%\newcommand{\PSh}{\mathrm{PSh}}
%\newcommand{\Sh}{\mathrm{Sh}}
%\newcommand{\Ext}{\mathrm{Ext}}
%\newcommand{\Tor}{\mathrm{Tor}}
%\newcommand{\Char}{\mathrm{char}}
%\newcommand{\Nat}{\mathrm{Nat}}
%\newcommand{\SL}{\mathrm{SL}}
%\newcommand{\Supp}{\mathrm{Supp}}
%\newcommand{\Pic}{\mathrm{Pic}}
%\newcommand{\Div}{\mathrm{Div}}
%\newcommand{\pt}{\mathrm{pt}}

% marhsf commands
%\newcommand{\Set}{\mathsf{Set}}
%\newcommand{\Grp}{\mathsf{Grp}}
%\newcommand{\Ab}{\mathsf{Ab}}
%\newcommand{\Ring}{\mathsf{Ring}}
%\newcommand{\Mod}{\mathsf{Mod}}
%\newcommand{\Alg}{\mathsf{Alg}}
%\newcommand{\Vect}{\mathsf{Vect}}
%\newcommand{\Top}{\mathsf{Top}}
%\newcommand{\AffSch}{\mathsf{AffSch}}
%\newcommand{\Sch}{\mathsf{Sch}}

% mathfrak commands
%\newcommand{\fka}{\mathfrak{a}}
%\newcommand{\fkb}{\mathfrak{b}}
%\newcommand{\fkc}{\mathfrak{c}}
%\newcommand{\fkg}{\mathfrak{g}}
%\newcommand{\fkh}{\mathfrak{h}}
%\newcommand{\fkm}{\mathfrak{m}}
%\newcommand{\fkN}{\mathfrak{N}}
%\newcommand{\fkp}{\mathfrak{p}}
%\newcommand{\fkq}{\mathfrak{q}}
%\newcommand{\fkR}{\mathfrak{R}}
%\newcommand{\fksl}{\mathfrak{sl}}

% mathcal commands
%\newcommand{\calA}{\mathcal{A}}
%\newcommand{\calB}{\mathcal{B}}
%\newcommand{\calC}{\mathcal{C}}
%\newcommand{\calD}{\mathcal{D}}
%\newcommand{\calE}{\mathcal{E}}
%\newcommand{\calF}{\mathcal{F}}
%\newcommand{\calG}{\mathcal{G}}
%\newcommand{\calH}{\mathcal{H}}
%\newcommand{\calI}{\mathcal{I}}
%\newcommand{\calJ}{\mathcal{J}}
%\newcommand{\calL}{\mathcal{L}}
%\newcommand{\calO}{\mathcal{O}}
%\newcommand{\calP}{\mathcal{P}}
%\newcommand{\calS}{\mathcal{S}}
%\newcommand{\calT}{\mathcal{T}}
%\newcommand{\calU}{\mathcal{U}}
%\newcommand{\calV}{\mathcal{V}}
%\newcommand{\calW}{\mathcal{W}}

% mathscr commands
%\newcommand{\scrA}{\mathscr{A}}
%\newcommand{\scrB}{\mathscr{B}}
%\newcommand{\scrC}{\mathscr{C}}
%\newcommand{\scrD}{\mathscr{D}}
%\newcommand{\scrE}{\mathscr{E}}
%\newcommand{\scrF}{\mathscr{F}}
%\newcommand{\scrG}{\mathscr{G}}
%\newcommand{\scrH}{\mathscr{H}}
%\newcommand{\scrI}{\mathscr{I}}
%\newcommand{\scrJ}{\mathscr{J}}
%\newcommand{\scrK}{\mathscr{K}}
%\newcommand{\scrR}{\mathscr{R}}
%\newcommand{\scrT}{\mathscr{T}}
%\newcommand{\scrX}{\mathscr{X}}
%\newcommand{\scrY}{\mathscr{Y}}
