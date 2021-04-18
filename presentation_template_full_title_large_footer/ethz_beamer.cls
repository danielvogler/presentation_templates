\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ethz_beamer}[2016/11/14 v1.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions
\LoadClass{beamer}

\RequirePackage{ifthen}
\RequirePackage{layouts}


%%%
%%%
%%% DEFINITIONS
%%%
%%%

%\PassOptionsToPackage{table,dvipsnames}{xcolor}
% Options for beamer:
%
% 9,10,11,12,13,14,17pt  Fontsizes
% 
% compress: navigation bar becomes smaller
% t       : place contents of frames on top (alternative: b,c)
% handout : handoutversion
% notes   : show notes
% notes=onlyslideswithnotes
%


%%% Modified Itemizing
\usepackage{amsfonts} % Package used for Item symbols
\setlength{\leftmargini}{1.75pt} % indention of item order 1
\setlength{\leftmarginii}{16pt} % indention of item order 2
\setlength{\leftmarginiii}{16pt} % indention of item order 3
\setlength{\labelsep}{10pt} %% Separation page to item

%% Size of items
\def\Tiny{\fontsize{4.25pt}{4.25pt}\selectfont}

%% Itemizing Symbol: Square
\setbeamertemplate{itemize item}[default]
\setbeamertemplate{itemize subitem}[circle]
\setbeamertemplate{itemize subsubitem}[square]

%%%
%%% COLORS
%%%
% tango sky blue
\definecolor{tangocolordarkskyblue}{HTML}{204A87}
\definecolor{tangocolormediumskyblue}{HTML}{3465A4}
\definecolor{tangocolorlightskyblue}{HTML}{729FCF}
% tango plum
\definecolor{tangocolordarkplum}{HTML}{5C3566}
\definecolor{tangocolormediumplum}{HTML}{75507B}
\definecolor{tangocolorlightplum}{HTML}{AD7FA8}
% scarlet red
\definecolor{tangocolordarkscarletred}{HTML}{A40000}
\definecolor{tangocolormediumscarletred}{HTML}{CC0000}
\definecolor{tangocolorlightscarletred}{HTML}{EF2929}
% aluminium
\definecolor{tangocolordarkaluminium}{HTML}{BABDB6}
\definecolor{tangocolormediumaluminium}{HTML}{D3D3D3}
\definecolor{tangocolorlightaluminium}{HTML}{EEEEEC}

% headline colors and fonts
\setbeamercolor{headline}{fg=tangocolordarkskyblue,bg=white}
\setbeamercolor{title in headline}{fg=tangocolordarkskyblue}
\setbeamercolor{footline}{fg=white,bg=tangocolordarkskyblue}
\setbeamercolor{title in footline}{fg=white}

%%% Color definitions
\usecolortheme[RGB={0,43,94}]{structure}
\definecolor{blue}{RGB}{0,43,94}
\definecolor{black}{RGB}{0,0,0}
\definecolor{white}{RGB}{255,255,255}
\definecolor{red}{RGB}{161,80,0}
\definecolor{itemblue}{RGB}{0,80,145} 

%%% title block color
\setbeamercolor{block title}{use=blue,fg=blue.fg,bg=blue.fg!20!bg}
\setbeamercolor{block title alerted}{use=alerted text,fg=alerted text.fg,bg=alerted text.fg!20!bg}
\setbeamercolor{block title example}{use=example text,fg=example text.fg,bg=example text.fg!20!bg}
%%% body block
\setbeamercolor{block body}{parent=normal text,use=block title,bg=block title.bg!50!bg}
\setbeamercolor{block body alerted}{parent=normal text,use=block title alerted}
\setbeamercolor{block body example}{parent=normal text,use=block title example}
%%% normal text
\setbeamercolor{normal text}{fg=black,bg=white}
\setbeamercolor{alerted text}{fg=tangocolormediumscarletred}



%%%
%%% ADDITIONAL DEFINITIONS
%%%
%%% title page additions
\newcommand\email[1]{\def\insertemail{#1}}
\newcommand\meeting[1]{\def\insertmeeting{#1}}
%%% uni logos
\newcommand\Ulogo[1]{\def\insertUlogo{#1}}
\Ulogo{\includegraphics[height=3.5ex]{./figures/ethz_logo_black_transparent}}
%%% group logo
\newcommand\Grouplogo[1]{\def\insertGrouplogo{#1}}
\Grouplogo{\includegraphics[height=3.5ex]{./figures/geg_logo}}



%%%
%%% HEADLINE
%%%
\setbeamercolor{seperation line}{bg=white}
\providecommand\insertframetitle{} 
%\addtobeamertemplate{frametitle}{\vskip-3.5ex}{}
\makeatletter
\defbeamertemplate*{frametitle}{mydefault}[1][left]
{
  \ifbeamercolorempty[bg]{frametitle}{}{\nointerlineskip}%
  \@tempdima=\textwidth%
  \advance\@tempdima by\beamer@leftmargin%
  \advance\@tempdima by\beamer@rightmargin%
  \begin{beamercolorbox}[sep=0.01cm,#1,wd=\the\@tempdima]{frametitle}
    \usebeamerfont{frametitle}%
    \vbox{}\vskip-1ex%
    \if@tempswa\else\csname beamer@fte#1\endcsname\fi%
    \quad\strut\insertframetitle\strut\par%
    %{%
    %  {\usebeamerfont{framesubtitle}\usebeamercolor[fg]{framesubtitle}\insertframesubtitle\strut\par}%
    %}%
    \vskip-1ex%
    \if@tempswa\else\vskip-.01cm\fi% set inside beamercolorbox... evil here...
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=\paperwidth]{footline}
    \rule{0pt}{0.3ex}
  \end{beamercolorbox}
}
\makeatother


%%%
%%% FOOTLINE
%%%
\makeatletter
\setbeamertemplate{footline}
{
  \@tempdima=\textwidth
  \advance\@tempdima by\beamer@leftmargin
  \advance\@tempdima by\beamer@rightmargin
  \begin{beamercolorbox}[wd=\paperwidth]{footline}
    \rule{0pt}{0.3ex}
  \end{beamercolorbox}
  \begin{beamercolorbox}[colsep=1.5pt,wd=1.0\paperwidth,ht=5.5ex,dp=0ex]{headline}
  \vbox{}\vskip15pt
  \begin{minipage}[c]{0.7\textwidth}
    \quad\insertUlogo\qquad\insertGrouplogo
  \end{minipage}
  %\makebox[0pt][l]{\quad\insertUlogo\qquad\insertGrouplogo}%
  \hspace*{\fill}
  %\begin{beamercolorbox}[colsep=0.0pt,wd=0.3\textwidth,ht=3.5ex,dp=0ex]{seperation line}
  \begin{minipage}[c]{0.3\textwidth}
    \llap{\insertmeeting\quad-\quad\insertdate\quad} \llap{Slide \insertpagenumber\quad}
  \end{minipage}

    
  %\end{beamercolorbox}
  %\hspace*{\fill}%
  %\llap{Slide \insertpagenumber\quad}
%  \qquad {\insertdate}
%  \hspace*{\fill} {\insertmeeting}
%  \hspace*{\fill} {\insertframenumber\totalframes} 
%  \qquad \null
  \vskip0.3ex
  \end{beamercolorbox}
}
\makeatother


%%%
%%% Titlepage
%%%
\newcommand{\totalframes}{}
\newcommand{\normalbg}{}
\newcommand{\firstbg}{\normalbg}
\newcommand{\lastbg}{}
%%% title page setup
\newcommand{\usespecialtitlepagetemplate}{
\makeatletter
\setbeamertemplate{title page}
{
  \vspace{3.5pt}
  \begin{beamercolorbox}[wd=0.99\paperwidth,ht=3.8ex,dp=1ex,sep=1.7ex,left,shadow=true]{title}
    \usebeamerfont{title}
    {\textbf{\Huge \inserttitle}\par}
    \ifx\insertsubtitle\@empty%
    \else%
      \vskip0.5em%
      {\usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle}\insertsubtitle\par}%
    \fi%     
   \end{beamercolorbox}%
  \vskip0.5em\par
   {\usebeamercolor[fg]{titlegraphic}\inserttitlegraphic\par}
  \vskip0.5em\par
   \begin{beamercolorbox}[wd=0.99\paperwidth,ht=1ex,dp=1ex,sep=2.7ex,left,shadow=true]{author}
    {\fontsize{11pt}{4pt}\usebeamerfont{author}{\insertauthor}}
   \end{beamercolorbox}
  \vskip0.5em\par
   \begin{beamercolorbox}[wd=0.99\paperwidth,ht=1ex,dp=1ex,sep=2.7ex,left,shadow=true]{institute}
     {\fontsize{10pt}{4pt}\usebeamerfont{author}{\insertinstitute}}
   \end{beamercolorbox}
  \vskip0.5em\par
  \begin{beamercolorbox}[wd=0.99\paperwidth,ht=1ex,dp=1ex,sep=2.7ex,left,shadow=true]{email}
     {\fontsize{10pt}{4pt}\usebeamerfont{author}{\insertemail}}
   \end{beamercolorbox}
\vskip1.5em
\vfill
}
\makeatother
}

%% Handout option
\DeclareOption{handout}{\gdef\beamer@currentmode{handout}}

%% Information floor
\DeclareOption{totalframes}{\renewcommand{\totalframes}{/\inserttotalframenumber}}

% execute options
\ProcessOptions

%%% Notes
%\mode<notes>

\mode<presentation>
{
  \useoutertheme{default}
}

\renewcommand{\familydefault}{phv}
\renewcommand{\sfdefault}{phv}
%\renewcommand{\normalsize}{\fontsize{10.5pt}{12.5pt}\xiiiv}

\DeclareFixedFont{\x}{T1}{phv}{m}{n}{10}
\DeclareFixedFont{\xb}{T1}{phv}{b}{n}{10}
\newfont{\xiiiv}{phvr8t at 30pt}
\newfont{\xiiivb}{phvb8t at 8.5pt}



%%%
%%% ADDITIONAL FEATURES
%%%

%%%
%%% OPTION TO WIDEN FRAME
%%%
\newcommand\Wider[2][3em]{%
\makebox[\linewidth][c]{%
  \begin{minipage}{\dimexpr\textwidth+#1\relax}
  \raggedright#2
  \end{minipage}%
  }%
}


%%%
%%% BEAMER TEMPLATE
%%%
%\setbeamertemplate{note page}[plain] 
\setbeamertemplate{note page}{\ \\[.3cm]
\textbf{\color{blue}Notes:}\\%[0.1cm]
{\footnotesize %\tiny
\insertnote}}
%\setbeameroption{notes on second screen}
%%% number figures
\setbeamertemplate{caption}[numbered]
%%% 
%%% NAVIGATION SYMBOLS
%%% 
\setbeamertemplate{navigation symbols}{} % suppresses all navigation symbols:
% \setbeamertemplate{navigation symbols}[horizontal] % Organizes the navigation symbols horizontally.
% \setbeamertemplate{navigation symbols}[vertical] % Organizes the navigation symbols vertically.
% \setbeamertemplate{navigation symbols}[only frame symbol] % Shows only the navigational symbol for navigating frames.
\setlayoutscale{0.5}
\setparametertextfont{\scriptsize}
\setlabelfont{\scriptsize}



%%%
%%% APPENDIX
%%%
\newcommand{\backupbegin}{
   \newcounter{framenumberappendix}
   \setcounter{framenumberappendix}{\value{framenumber}}
}
\newcommand{\backupend}{
   \addtocounter{framenumberappendix}{-\value{framenumber}}
   \addtocounter{framenumber}{\value{framenumberappendix}} 
}




%%%
%%% TIKZ
%%%
\usepackage{tikz}
\usetikzlibrary{shapes,arrows}
\usetikzlibrary{positioning}
\usetikzlibrary{fadings,shapes.arrows,shadows}
\usepackage{xparse}
%%% thick arrows
\tikzfading[name=arrowfading, top color=transparent!0, bottom color=transparent!95]
\tikzset{arrowfill/.style={#1}}
\tikzset{arrowstyle/.style n args={3}{draw=#2,arrowfill={#3}, single arrow,minimum height=#1, single arrow,
single arrow head extend=.1cm,}}
\NewDocumentCommand{\tikzfancyarrow}{O{2cm} O{FireBrick} O{top color=OrangeRed!20, bottom color=Red} m}{
\tikz[baseline=-0.5ex]\node [arrowstyle={#1}{#2}{#3}] {#4};
}
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{
            \node[shape=circle,draw,inner sep=1pt] (char) {#1};}}
            
%%% boxes
\usepackage[framemethod=tikz]{mdframed}
\mdfdefinestyle{fancy}{
  roundcorner=5pt,
  linewidth=4pt,
  linecolor=red!80,
  backgroundcolor=red!20,
  leftmargin=0.0cm,
  rightmargin=0.0cm,
  innerleftmargin=0.1cm,
  innerrightmargin=0.1cm
}
\newmdenv[style=fancy]{gobackbox}

\mdfdefinestyle{bluebox}{
  roundcorner=5pt,
  linewidth=4pt,
  linecolor=blue!80,
  backgroundcolor=blue!20,
  leftmargin=0.0cm,
  rightmargin=0.0cm,
  innerleftmargin=0.1cm,
  innerrightmargin=0.1cm
}
\newmdenv[style=bluebox]{bluebox}



%%% 
%%% ADDITIONAL PACKAGES
%%%
%hyperref={bookmarksopen,bookmarksnumbered} 
\usepackage{beamerbasenotes}
\usepackage{graphicx} 			% graphic package
\usepackage{tabularx} 			% for tabularx envionment fo rtables
\usepackage{hyperref}
\usepackage[square,numbers]{natbib}
\usepackage[font={small},labelfont={color=tangocolormediumskyblue,small,bf}]{caption}
\renewcommand{\figurename}{Fig.}
%\usepackage{multirow} % enables stretching of multiple rows in tables
%\usepackage{rotating}
%\usepackage{lscape}     		% landscape package
%\usepackage{colortbl}
%\usepackage{transparent}
%\usepackage{array}
%\usepackage{placeins}
%\usepackage{pgfkeys}
%\usepackage{auto-pst-pdf}
%\usepackage{etex}
%\usepackage{multimedia}
%\usepackage{xmpmulti}
\usepackage{mathtools}
\usepackage{amsmath}
\usepackage{animate}

%\usepackage{subfig}
%%% options for enumerate
%\usepackage{textcomp}% <- this package
%\usepackage{epstopdf}
%%% marker symbols
%\usepackage{wasysym}
%\usepackage{latexsym}
%\usepackage{appendixnumberbeamer}
%%% for plus sign in math mode
%\usepackage{pifont}
%\usepackage{comment}
%\usepackage{subcaption}

%%% change caption properties
%\usepackage{caption}
%\captionsetup{font=scriptsize,labelfont=scriptsize,labelfont=bf}
%%% allow superposition of images
%\def\Put(#1,#2)#3{\leavevmode\makebox(0,0){\put(#1,#2){#3}}}

