% This is a format for my notes

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mynote}[01/11/2024 mynotes document class]

\LoadClass[
    twoside,
	openany,
    fontset=windows,
    AutoFakeBold
]{ctexbook}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{mathrsfs}
\RequirePackage{tikz-cd}
\RequirePackage{enumerate}
\RequirePackage{tikz}
\RequirePackage{tcolorbox}
\RequirePackage{varwidth}
\RequirePackage{nicematrix}
\RequirePackage[
    nottoc,
    notlot,
    notlof
]{tocbibind}
\RequirePackage[
    top = 25mm,
    bottom = 20mm,
    left = 30mm,
    right = 30mm,
    a4paper
]{geometry}
\RequirePackage{hyperref}
\RequirePackage{enumerate}
\RequirePackage{ulem}
\RequirePackage{appendix}
\RequirePackage{makeidx}
\RequirePackage{graphicx}
\RequirePackage{fontspec}
\tcbuselibrary{theorems, skins, hooks, breakable}

% Math settings
\everymath{\displaystyle}

\pagestyle{headings}
\setcounter{MaxMatrixCols}{20}
\newcommand{\defeq}{\mathrel{\coloneqq}}
\newcommand{\eqdef}{\mathrel{\eqqcolon}}
\newcommand{\defequiv}{\mathrel{\vcentcolon\Leftrightarrow}}
\hypersetup{
    colorlinks = true,
    linkcolor = blue,
    citecolor = green,
    urlcolor = cyan
}

% colors
\definecolor{rmkbg}{HTML}{E6F8F6}
\definecolor{rmkfr}{HTML}{39C5BB}%MIKU
\definecolor{pfbg}{HTML}{E9FCFB}
\definecolor{pffr}{HTML}{4DEBDD}
\definecolor{thmbg}{HTML}{DFEEFB}
\definecolor{thmfr}{HTML}{0077DD}%otae~
\definecolor{Rmkbg}{HTML}{FFEAE3}
\definecolor{Rmkfr}{HTML}{FF5522}%kasumi kirakiradokidoki!
\definecolor{corbg}{HTML}{F4ECFB}
\definecolor{corfr}{HTML}{AA66DD}%arisa~
\definecolor{lembg}{HTML}{FFF9E1}
\definecolor{lemfr}{HTML}{FFCC11}%saaya~
\definecolor{propbg}{HTML}{FFEAF6}
\definecolor{propfr}{HTML}{FF55BB}%rimirin~
\definecolor{egbg}{HTML}{E5F9E5}
\definecolor{egfr}{HTML}{32CD32}
\definecolor{defbg}{HTML}{FAE5E4}
\definecolor{deffr}{HTML}{D82C2A}%疑似Random Star

% 章节设置

\ctexset{
    contentsname = {
        \hfill\bfseries\Large Contents\hfill
    },
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
        name = {Appendix~},
    },
}

\RequirePackage{titlesec}
\titleformat{\section}{\bfseries\raggedright\zihao{-3}}{\arabic{section}.}{1em}{}

\titleformat{\subsection}[runin]
	{\bfseries\raggedright\zihao{-4}}{\arabic{section}.\arabic{subsection}.}{0.8em}{}[.]

% settings of amsthm
%\newtheoremstyle{dotless}{3pt}{3pt}{}{2em}{\bfseries}{}{\ccwd}{}
%\theoremstyle{dotless}
\newtcbtheorem[number within=section]{theorem}{Theorem}
{%
	enhanced,
	breakable,
	colback = thmbg,
	frame hidden,%隐藏边框
	boxrule = 0sp,
	borderline west = {2pt}{0pt}{thmfr},%在左侧添加边界线
	sharp corners,%设置box的角为锐角
	detach title,%分离标题, 意味着标题不显示在box上方
	before upper = \tcbtitle\par\smallskip,%在内容上方插入标题, 并添加一个小的垂直间距
	coltitle = thmfr,
	fonttitle = \bfseries,%标题字体为粗体
	separator sign none,
	description delimiters parenthesis,
	description font = \mdseries,%标题字体为正体
	separator sign none,%不使用分割线
	segmentation style={solid, thmfr},
}
{Thm}

\newtcbtheorem[use counter from=theorem, number within=section]{corollary}{Corollary}
{%
	enhanced,
	breakable,
	colback = corbg,
	frame hidden,
	boxrule = 0sp,
	borderline west = {2pt}{0pt}{corfr},
	sharp corners,
	detach title,
	before upper = \tcbtitle\par\smallskip,
	coltitle = corfr,
	fonttitle = \bfseries,
	separator sign none,
	description delimiters parenthesis,
	description font = \mdseries,
	separator sign none,
	segmentation style={solid, corfr}
}
{Cor}

\newtcbtheorem[use counter from=theorem, number within=section]{lemma}{Lemma}
{%
	enhanced,
	breakable,
	colback = lembg,
	frame hidden,
	boxrule = 0sp,
	borderline west = {2pt}{0pt}{lemfr},
	sharp corners,
	detach title,
	before upper = \tcbtitle\par\smallskip,
	coltitle = lemfr,
	fonttitle = \bfseries,
	separator sign none,
	description delimiters parenthesis,
	description font = \mdseries,
	separator sign none,
	segmentation style={solid, lemfr}
}
{Lem}

\newtcbtheorem[use counter from=theorem, number within=section]{proposition}{Propositon}
{%
	enhanced,
	breakable,
	colback = propbg,
	frame hidden,
	boxrule = 0sp,
	borderline west = {2pt}{0pt}{propfr},
	sharp corners,
	detach title,
	before upper = \tcbtitle\par\smallskip,
	coltitle = propfr,
	fonttitle = \bfseries,
	separator sign none,
	description delimiters parenthesis,
	description font = \mdseries,
	separator sign none,
	segmentation style={solid, propfr}
}
{Prop}

\newtcbtheorem[use counter from=theorem, number within=section]{remark}{Remark}
{%
	enhanced,
	breakable,
	colback = Rmkbg,
	frame hidden,
	boxrule = 0sp,
	borderline west = {2pt}{0pt}{Rmkfr},
	sharp corners,
	detach title,
	before upper = \tcbtitle\par\smallskip,
	coltitle = Rmkfr,
	fonttitle = \bfseries,
	separator sign none,
	description delimiters parenthesis,
	description font = \mdseries,
	separator sign none,
	segmentation style={solid, Rmkfr}
}
{Rmk}

\newtcbtheorem[use counter from=theorem, number within=section]{definition}{Definition}
{%
	enhanced,%启用高级选项
    before skip=2mm,%box前空2mm
    after skip=2mm,%box后空2mm
    breakable,%自动分页
    colback=defbg,%背景色
    colframe=deffr,%边框色
    boxrule=0.5mm,%边框厚度
    attach boxed title to top left={xshift=1cm, yshift*=1mm-\tcboxedtitleheight},%把标题附在左上角并向右偏移1cm, 垂直方向偏移1mm并设置根据内容自动调整
    varwidth boxed title*=-3cm,%可变标题宽度, 且要求最多比box少3cm, 需要varwidth宏包
    colbacktitle=deffr,%标题的背景色
    boxed title style={
        frame code={
			\path[fill=tcbcolback]
			([yshift=-1mm,xshift=-1mm]frame.north west)
			arc[start angle=0,end angle=180,radius=1mm]
			([yshift=-1mm,xshift=1mm]frame.north east)
			arc[start angle=180,end angle=0,radius=1mm];
			\path[left color=tcbcolback!60!black,right color=tcbcolback!60!black,
			middle color=tcbcolback!80!black]
			([xshift=-2mm]frame.north west) -- ([xshift=2mm]frame.north east)
			[rounded corners=1mm]-- ([xshift=1mm,yshift=-1mm]frame.north east)
			-- (frame.south east) -- (frame.south west)
			-- ([xshift=-1mm,yshift=-1mm]frame.north west)
			[sharp corners]-- cycle;
		},%使用Tikz自定义标题的框架
        interior engine=empty,%设置填充透明, 相当于标题字体设置成白色
    },
	fonttitle=\bfseries,
	separator sign none,
	description delimiters parenthesis,
	title={#2},#1
}
{Def}

\newtcbtheorem[use counter from=theorem, number within=section]{axiom}{Axiom}
{%
	enhanced,
	breakable,
	colback = thmbg,
	frame hidden,
	boxrule = 0sp,
	borderline west = {2pt}{0pt}{thmfr},
	sharp corners,
	detach title,
	before upper = \tcbtitle\par\smallskip,
	coltitle = thmfr,
	fonttitle = \bfseries,
	separator sign none,
	description delimiters parenthesis,
	description font = \mdseries,
	separator sign none,
	segmentation style={solid, thmfr}
}
{Ax}

\newtcbtheorem[use counter from=theorem, number within=section]{example}{Example}
{%
	enhanced,
	breakable,
	colback = egbg,
	frame hidden,
	boxrule = 0sp,
	borderline west = {2pt}{0pt}{egfr},
	sharp corners,
	detach title,
	before upper = \tcbtitle\par\smallskip,
	coltitle = egfr,
	fonttitle = \bfseries,
	separator sign none,
	description delimiters parenthesis,
	description font = \mdseries,
	separator sign none,
	segmentation style={solid, egfr}
}
{eg}

\numberwithin{equation}{section}

\newcommand{\thmref}[1]{Theorem~\ref{#1}}
\newcommand{\propref}[1]{Propositon~\ref{#1}}
\newcommand{\lemref}[1]{Lemma~\ref{#1}}
\newcommand{\corref}[1]{Corollary~\ref{#1}}
\newcommand{\defref}[1]{Definition~\ref{#1}}
\newcommand{\axref}[1]{Axiom~\ref{#1}}
\newcommand{\exref}[1]{\ref{#1}}
\newcommand{\rmkref}[1]{Remark~\ref{#1}}
\newcommand{\secref}[1]{\S\ref{#1}}
\newcommand{\appref}[1]{Appendix~\ref{#1}}
\newcommand{\pref}[1]{page~\pageref{#1}}

\newtcolorbox{myproof}[1][]{
    enhanced,%启用高级选项
    before skip=2mm,%box前空2mm
    after skip=2mm,%box后空2mm
    breakable,%自动分页
    colback=pfbg,%背景色
    colframe=pffr,%边框色
    fonttitle=\itshape,%标题样式
    boxrule=0.5mm,%边框厚度
    attach boxed title to top left={xshift=1cm, yshift*=1mm-\tcboxedtitleheight},%把标题附在左上角并向右偏移1cm, 垂直方向偏移1mm并设置根据内容自动调整
    varwidth boxed title*=-3cm,%可变标题宽度, 且要求最多比box少3cm, 需要varwidth宏包
    colbacktitle=pffr,%标题的背景色
    boxed title style={
        frame code={
			\path[fill=tcbcolback]
			([yshift=-1mm,xshift=-1mm]frame.north west)
			arc[start angle=0,end angle=180,radius=1mm]
			([yshift=-1mm,xshift=1mm]frame.north east)
			arc[start angle=180,end angle=0,radius=1mm];
			\path[left color=tcbcolback!60!black,right color=tcbcolback!60!black,
			middle color=tcbcolback!80!black]
			([xshift=-2mm]frame.north west) -- ([xshift=2mm]frame.north east)
			[rounded corners=1mm]-- ([xshift=1mm,yshift=-1mm]frame.north east)
			-- (frame.south east) -- (frame.south west)
			-- ([xshift=-1mm,yshift=-1mm]frame.north west)
			[sharp corners]-- cycle;
		},%使用Tikz自定义标题的框架
        interior engine=empty,%设置填充透明, 相当于标题字体设置成白色
    },
    #1
}
\let\oldproof\proof 
\let\endoldproof\endproof
\renewcommand{\proofname}{proof}
\renewenvironment{proof}[1][\proofname]
{
    \begin{myproof}[title = #1]
    \pushQED{\qed}
}
{
    \popQED
    \end{myproof}
}

% remark tcolorbox
\usetikzlibrary{arrows,calc,shadows.blur}
\newtcolorbox{remarkstar}[1][]{%
	enhanced,
	colback=rmkbg,
	colframe=rmkfr,
	size=small,
	boxrule=1pt,
	title=\textbf{Note:},
	halign title=flush center,
	coltitle=rmkfr,
	breakable,
	drop shadow=black!50!white,
	attach boxed title to top left={xshift=1cm,yshift=-\tcboxedtitleheight/2,yshifttext=-\tcboxedtitleheight/2},
	minipage boxed title=1.5cm,
	boxed title style={%
		colback=white,
		size=fbox,
		boxrule=1pt,
		boxsep=2pt,
		underlay={%
			\coordinate (dotA) at ($(interior.west) + (-0.5pt,0)$);
			\coordinate (dotB) at ($(interior.east) + (0.5pt,0)$);
			\begin{scope}
				\clip (interior.north west) rectangle ([xshift=3ex]interior.east);
				\filldraw [white, blur shadow={shadow opacity=60, shadow yshift=-.75ex}, rounded corners=2pt] (interior.north west) rectangle (interior.south east);
			\end{scope}
			\begin{scope}[rmkfr]
				\fill (dotA) circle (2pt);
				\fill (dotB) circle (2pt);
			\end{scope}
		},
	},
	#1,
}