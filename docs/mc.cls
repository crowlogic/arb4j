% mc.cls -- For Mathematical Communications
% This class file is made available for use by authors who wish to
% prepare an article for publication in the Mathematical Communications.
% The user may not exploit any part of the class file commercially.
%
% This class file is provided on an 'as is' basis. Authors are not allowed
% to change this file.
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mc}
      [2008/01/02 v1.1 Class for Mathematical Communications]


\LoadClass[twoside,10pt]{article}

\RequirePackage{graphicx}
\RequirePackage{latexsym,amsfonts,amssymb,amsbsy,amsmath,amsthm} 
\RequirePackage[displaymath,mathlines,pagewise]{lineno}


\RequirePackage{ifthen}


\newboolean{PG@odd}  % set true for first page number is odd
\newboolean{REV@art} % set true for Review Article
\newboolean{DRAFT@copy} % set true for Draft copy
\newboolean{ONE@page} % set true for the first page end at abstract
\newboolean{START@even} % set true for the book first page is even
\setboolean{PG@odd}{true}
\setboolean{REV@art}{false}
\setboolean{DRAFT@copy}{false}
\setboolean{ONE@page}{false}
\setboolean{START@even}{false}
\DeclareOption{odd}{\setboolean{PG@odd}{true}}
\DeclareOption{even}{\setboolean{PG@odd}{false}}
\DeclareOption{review}{\setboolean{REV@art}{true}}
\DeclareOption{draft}{\setboolean{DRAFT@copy}{true}}
\DeclareOption{onepage}{\setboolean{ONE@page}{true}}
\DeclareOption{starteven}{\setboolean{START@even}{true}}

\ProcessOptions

% general setting
\headsep=5mm
\headheight=5mm
\topmargin=0pt
\oddsidemargin=0pt
\evensidemargin=0pt
\textheight=195truemm   %\textheight=215truemm
\textwidth=128truemm  %\textwidth=145truemm

\setlength{\arraycolsep}{1.7pt}

\setlength{\oddsidemargin}{8mm}
\setlength{\evensidemargin}{8mm}
\ifthenelse{\boolean{START@even}}
{ \setlength{\oddsidemargin}{8mm}
  \setlength{\evensidemargin}{8mm} }
{}

\setlength\footnotesep{3.5\p@}
\footskip=8truemm

\renewcommand{\baselinestretch}{1.0}
\renewcommand{\arraystretch}{1.0}
\abovedisplayskip=10pt plus 9pt minus 2.5pt%
\belowdisplayskip=10pt plus 9pt minus 2.5pt


\AtBeginDocument{
  \immediate\write\@auxout{\string
  \newlabel{FirstPage}{{}{\thepage}}}
}

\AtEndDocument{
  \clearpage\addtocounter{page}{-1}
  \immediate\write\@auxout{\string
  \newlabel{LastPage}{{}{\thepage}}}
  \addtocounter{page}{1}
}

\newcommand\journalname{Mathematical Communications}
\newcommand\thisnumber{1}
\newcommand\thisyear {2009}
\newcommand\thismonth{XXXX}
\newcommand\thisvolume{14}
\newcommand\datereceived{\today}
\newcommand\dateaccepted{\today}

\newcommand\rec{\begin{center} Received \datereceived;  accepted \dateaccepted \end{center}}




\def\thispagestart{\pageref{FirstPage}}
\def\thispageend{\pageref{LastPage}}


\def\ps@firstpage{\ps@empty
\def\@oddfoot{ \hspace*{-2.33cm}\begin{tabular}{ll}
{\footnotesize https://www.mathos.unios.hr/mc} &\\
{\footnotesize \copyright \thisyear\  School of Applied Mathematics and Informatics, University of Osijek}
\end{tabular}
}
%\def\@oddfoot{\hspace*{-2mm}\begin{tabular}{ll}
%{\footnotesize https://www.mathos.unios.hr/mc} & {\footnotesize \copyright \thisyear\  School of Applied Mathematics and Informatics,}\\
%{\footnotesize University of Osijek} &
%\end{tabular}
%}
%\footnotesize http://www.mathos.hr/mc \quad
%               \copyright \thisyear\  School of Applied Mathematics and Informatics, University of Osijek}
  \let\@evenfoot\@oddfoot
%  \def\@oddhead{\usebox{\lheadbox} \hfil \usebox{\rheadbox}
  \def\@oddhead{
      \parbox{\textwidth}{\footnotesize MATHEMATICAL COMMUNICATIONS \hfill{\normalsize\thepage}
\\ Math. Commun.~{\bfseries\thisvolume}(\thisyear), \thispagestart--\thispageend}
  }
  \let\@evenhead\@oddhead % in case an article starts on a left-hand page
  \let\@mkboth\@empty
}

\def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
%      \def\@oddhead{\footnotesize \thepage\hfil\leftmark\hfil}%
%      \def\@evenhead{\footnotesize \hfil\rightmark\hfil\thepage}%
\ifthenelse{\boolean{PG@odd}}
      { \def\@evenhead{\footnotesize \thepage\hfil\leftmark\hfil}   % The first page number is odd
        \def\@oddhead{\footnotesize \hfil\rightmark\hfil\thepage} } %
      { \def\@oddhead{\footnotesize \thepage\hfil\leftmark\hfil}    % The first page number is even
        \def\@evenhead{\footnotesize \hfil\rightmark\hfil\thepage} }%
      \let\@mkboth\markboth
}

\renewcommand\maketitle{\par
   \begingroup
   \global\@topnum\z@
   \@maketitle
   \thispagestyle{firstpage} \@thanks
   \endgroup
   \global\let\thanks\relax
   \global\let\maketitle\relax
   \global\let\@maketitle\relax
   \global\let\@thanks\@empty
   \global\let\@author\@empty
   \global\let\@date\@empty
   \global\let\@title\@empty
   \global\let\title\relax
   \global\let\author\relax
   \global\let\date\relax
   \global\let\and\relax


}

%
\renewcommand\@maketitle{
  \normalfont\normalsize
  \global\topskip8\p@\relax % 5.5pc   "   "   "     "     "
  \vfil\null
%  \vskip 30\p@
  \@settitle
  \ifx\@empty\author
     \else
         \@setauthor
         \markboth
          {\ifx\@empty\shortauthor {\footnotesize\@author}
\else {\footnotesize \noexpand\shortauthor} \fi
}
  \fi
  \ifx\@empty\@address \else \@setaddress \fi
\rec
\noindent\hrulefill
  \@setabstract
  \vspace{-12pt}
    \ifx\@empty\@ams\else \@setams\fi
    \ifx\@empty\@keywords\else \@setkeywords\fi
  \ifthenelse{\boolean{ONE@page}}
  {}
  {\noindent\hrulefill}
  \normalsize
}

% footnote for corr author



%\setlength{\skip\footins}{2.5pc}
\renewcommand{\footnoterule}{\noindent\rule{5pc}{0.25pt}\vspace*{6pt}}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\long\def\@makefntext#1{\parindent 1em
\noindent{$\m@th^{\@thefnmark}$}#1}

%\def\corraddr#1{\footnotetext[1]{Correspondence to: #1}\stepcounter{footnote}}
\def\corraddr#1{} % do not need address anymore!


\def\email#1{\def\@email{#1}}
\let\@email=\@empty
\def\@setemail{{\it Email address:} \@email}

\def\emails#1{\def\@emails{#1}}
\let\@emails=\@empty
\def\@setemails{{\it Email addresses:} \@emails}

%\def\corrauth{\footnotemark[1]\footnotetext[1]{Corresponding author.
\def\corrauth{\footnote{Corresponding author.
 \ifx\@empty\@email\else \@setemail\fi
 \ifx\@empty\@emails\else \@setemails\fi}\stepcounter{footnote}}



\def\affilnum#1{${}^{#1}$}
\def\affil#1{${}^{#1}$}
\def\comma{$^{\textrm{,}}$}

%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% Article titles
%
% Usage: \title[Short title]{Full title}
% [Short title] is optional; use where title is too long
% or contains footnotes, 50 characters maximum
%
\renewcommand*{\title}[2][]{\gdef\shorttitle{#1}\gdef\@title{#2}}
%\let\shorttitle=\empty
\def\@settitle{
\let \footnote \thanks
  \begin{center}
  \large  \bfseries
    \@title
  \end{center}
  }
%
% List of authors
%
% Usage \author[Short form]{List of all authors}
% The short form excludes footnote symbols linking authors to addresses
% and is used for running heads in printed version (but not on preprints)
%
%\let\shortauthor=\empty
\renewcommand*{\author}[2][?]{
     \gdef\shortauthor{?}
     \gdef\@author{#2}
   \ifthenelse{\equal{#1}{?}}
     { \gdef\shortauthor{\let\comma=\empty \let\corrauth=\empty \renewcommand{\affil}[1]{} #2} }
     { \gdef\shortauthor{#1}}
}
\def\@setauthor{\begin{center}
  \sc  \@author
    \end{center}%
}

%
% Affiliation (authors address)
%
% Usage: \address{Address of first author}
%        \address{Address of second author}
% Use once for each address, use symbols \dag \ddag \S \P $\|$
% to connect authors with addresses
%
\def\address#1{\def\@address{#1}}
\let\@address=\@empty
\def\@setaddress{\vspace{-12pt}
   \begin{flushleft}
   %\rm\small \@address
   \rm\it\small \@address
   \end{flushleft}
}
%
\def\keywords#1{\def\@keywords{#1}}
\let\@keywords=\@empty
\def\@setkeywords{
     \addtolength{\topsep}{-8pt}
     \begin{trivlist}
          \item[]\rm\small {\bf\small Keywords}: \@keywords
     \end{trivlist}
}
%

%
%
%
% American Mathematical Society Classification Numbers
% Usage: \ams{57.XX, 58.XX}
%
\def\ams#1{\def\@ams{#1}}
\let\@ams=\@empty
\def\@setams{
     \addtolength{\topsep}{-4pt}
     \begin{trivlist}
     \item[]\rm\small {\bf \small AMS subject classifications}: \@ams
     \end{trivlist}
}
%
%
%
\newbox\abstractbox
\renewenvironment{abstract}{%
  \ifx\maketitle\relax
    \ClassWarning{\@classname}{Abstract should precede
      \protect\maketitle\space in AMS documentclasses; reported}%
  \fi
  \global\setbox\abstractbox=\vtop \bgroup
    \normalfont\small
    \list{}{\labelwidth\z@
           \leftmargin0pc %\rightmargin\leftmargin
       \itemindent\z@
      \parsep\z@ \@plus\p@
      \let\fullwidthdisplay\relax
    }
    \item[\hskip\labelsep\bfseries\abstractname.]%
}{%
  \endlist\egroup
  \ifx\@setabstract\relax \@setabstracta \fi
}
\def\@setabstract{\@setabstracta \global\let\@setabstract\relax}
\def\@setabstracta{%
  \ifvoid\abstractbox
  \else
    \skip@6\p@ \advance\skip@-\lastskip
    \advance\skip@-\baselineskip \vskip\skip@
    \box\abstractbox
    \prevdepth\z@ % because \abstractbox is a vtop
  \fi
}



\def\proofBox{\hfill $\Box$}
%========================= Floats, tables, figures =================
%\renewcommand{\floatpagefraction}{1}
%\floatsep=10pt plus 2.5pt minus 1pt
%\textfloatsep=10pt plus 2.5pt minus 1pt
%\intextsep=10pt plus 2.5pt minus 1pt
%%\doublerulesep=0pt
%
%\abovecaptionskip=3pt
%\belowcaptionskip=5pt
%
%%
%% Insert \small and remove colon after table/figure number
%\long\def\@makecaption#1#2{%
%  \vskip\abovecaptionskip
%  \small
%  \sbox\@tempboxa{#1 #2}%
%  \ifdim \wd\@tempboxa >\hsize
%    #1 #2\par
%  \else
%    \global \@minipagefalse
%    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
%  \fi
%  \vskip\belowcaptionskip}
%
%\@addtoreset{table}{section}
%\renewcommand\thetable{\thesection.\arabic{table}}
%\def\fnum@table{\tablename\nobreakspace\thetable:}
%
%\@addtoreset{figure}{section}
%\renewcommand\thefigure{\thesection.\arabic{figure}}
%\renewcommand\figurename{Fig.}
%\def\fnum@figure{\figurename\nobreakspace\thefigure.}

\renewcommand{\floatpagefraction}{1}
\floatsep=10pt plus 2.5pt minus 1pt
\textfloatsep=10pt plus 2.5pt minus 1pt
\intextsep=10pt plus 2.5pt minus 1pt
%\doublerulesep=0pt

\abovecaptionskip=3pt
\belowcaptionskip=5pt

%%
%% Insert \small and remove colon after table/figure number
%\long\def\@makecaption#1#2{%
%  \vskip\abovecaptionskip
%  \small
%  \sbox\@tempboxa{#1 #2}%
%  \ifdim \wd\@tempboxa >\hsize
%    #1 #2\par
%  \else
%    \global \@minipagefalse
%    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
%  \fi
%  \vskip\belowcaptionskip}

% caption in small font
\long\def\@makecaption#1#2{%
  \renewcommand{\baselinestretch}{0.5}\rm
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\sf \footnotesize #1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    {\sf \footnotesize #1: #2}\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip
  \renewcommand{\baselinestretch}{1}\rm
}


%\@addtoreset{table}{section}
%\renewcommand\thetable{\thesection.\arabic{table}}
%\def\fnum@table{\tablename\nobreakspace\thetable:}
%
%\@addtoreset{figure}{section}
%\renewcommand\thefigure{\thesection.\arabic{figure}}
%\renewcommand\figurename{Fig.}
%\def\fnum@figure{\figurename\nobreakspace\thefigure.}



%======================== Section ===============================
\def\@seccntformat#1{\csname the#1\endcsname. }
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                     {-3.5ex \@plus -1ex \@minus -.2ex}%
                                     {2.3ex \@plus.2ex}%
                                     {\normalfont\large\bfseries}}
\renewcommand\subsection{\@startsection {subsection}{2}{\z@}%
                                         {-3.25ex\@plus -1ex \@minus -.2ex}%
                                        {1.5ex \@plus .2ex}%
                                        {\normalfont\large\bfseries}}

%======================== Bibliography ===============================
\renewcommand\@openbib@code{\parsep \z@ \itemsep \z@ \parskip \z@ \small}

%======================== Equation ===================================
%\@addtoreset{equation}{section}
%\renewcommand\theequation{\arabic{equation}}

%======================== Theorem, Lemma, etc., and proof ============
%\def\@begintheorem#1#2{\trivlist
%   \item[\hskip \labelsep{\bfseries #1\ #2.}]\itshape}
\newtheorem{theorem}{Theorem}
\newtheorem{lemma}{Lemma}
\newtheorem{proposition}{Proposition}
\newtheorem{corollary}{Corollary}
\newtheorem{remark}{Remark}
\newtheorem{definition}{Definition}
\newtheorem{condition}{Condition}
\newtheorem{example}{Example}
\newtheorem{conclusion}{Conclusion}
\newtheorem{conjecture}{Conjecture}
\newtheorem{algorithm}{Algorithm}
\newtheorem{assumption}{Assumption}
\newtheorem{assertion}{Assertion}
\newtheorem{property}{Property}
\newtheorem{problem}{Problem}
\newtheorem{claim}{Claim}
\newtheorem{question}{Question}
%\renewenvironment{proof} {\par{\bf Proof.} \ignorespaces}{\par\medskip}
\renewcommand{\proofname}{{\bf Proof}}

%===========================================================================


\pagestyle{headings}

\renewcommand\markboth[2]{%
  \def\@evenhead{\thepage\hfill {\footnotesize\sc #1}\hfill}%
  \def\@oddhead{\hfill{\footnotesize\sc #2}\hfill \thepage}%
}



\markboth{}{}

%da lineno radi s okolinama iz math enviromenta
\let\oldequation\equation%
\let\endoldequation\endequation%
\renewenvironment{equation}%
  {\linenomath\oldequation}{\endoldequation\endlinenomath}%
%
\expandafter\let\expandafter\oldequationstar\csname equation*\endcsname%
\expandafter\let\expandafter\endoldequationstar\csname endequation*\endcsname%
\renewenvironment{equation*}%
  {\linenomath\oldequationstar}{\endoldequationstar\endlinenomath}%
%
\let\oldalign\align%
\let\endoldalign\endalign%
\renewenvironment{align}%
  {\linenomath\oldalign}{\endoldalign\endlinenomath}%
%
 %
\expandafter\let\expandafter\oldalignstar\csname align*\endcsname%
\expandafter\let\expandafter\endoldalignstar\csname endalign*\endcsname%
\renewenvironment{align*}%
  {\linenomath\oldalignstar}{\endoldalignstar\endlinenomath}%
%
\let\oldflalign\flalign%
\let\endoldflalign\endflalign%
\renewenvironment{flalign}%
  {\linenomath\oldflalign}{\endoldflalign\endlinenomath}%
%
\expandafter\let\expandafter\oldflalignstar\csname flalign*\endcsname%
\expandafter\let\expandafter\endoldflalignstar\csname endflalign*\endcsname%
\renewenvironment{flalign*}%
  {\linenomath\oldflalignstar}{\endoldflalignstar\endlinenomath}%
%
\let\oldalignat\alignat%
\let\endoldalignat\endalignat%
\renewenvironment{alignat}%
  {\linenomath\oldalignat}{\endoldalignat\endlinenomath}%
%
\expandafter\let\expandafter\oldalignatstar\csname alignat*\endcsname%
\expandafter\let\expandafter\endoldalignatstar\csname endalignat*\endcsname%
\renewenvironment{alignat*}%
  {\linenomath\oldalignatstar}{\endoldalignatstar\endlinenomath}%
%
\let\oldgather\gather%
\let\endoldgather\endgather%
\renewenvironment{gather}%
  {\linenomath\oldgather}{\endoldgather\endlinenomath}%
%
\expandafter\let\expandafter\oldgatherstar\csname gather*\endcsname%
\expandafter\let\expandafter\endoldgatherstar\csname endgather*\endcsname%
\renewenvironment{gather*}%
  {\linenomath\oldgatherstar}{\endoldgatherstar\endlinenomath}%
%
\let\oldmultline\multline%
\let\endoldmultline\endmultline%
\renewenvironment{multline}%
  {\linenomath\oldmultline}{\endoldmultline\endlinenomath}%
%
\expandafter\let\expandafter\oldmultlinestar\csname multline*\endcsname%
\expandafter\let\expandafter\endoldmultlinestar\csname endmultline*\endcsname%
\renewenvironment{multline*}%
  {\linenomath\oldmultlinestar}{\endoldmultlinestar\endlinenomath}%
%

\endinput
