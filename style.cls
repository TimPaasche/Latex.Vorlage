%###################################################################################################
%#                                         DOCUMENT CLASS                                          #
%###################################################################################################

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{style}
\LoadClass[11pt, a4paper, twoside, german, final, openany]{memoir}


%###################################################################################################
%#                                            PACKAGES                                             #
%###################################################################################################
\RequirePackage[utf8]{inputenc}                     % Required for inputting international characters
\RequirePackage[T1]{fontenc}                        % Output font encoding for international characters
\RequirePackage{xcolor}                             % for named colors
\RequirePackage{eso-pic}                            % required to place huge uni logo at the back - on title page
\RequirePackage{graphicx}                           % for pictures
\RequirePackage[hidelinks]{hyperref}                % for hyperlinks 
\RequirePackage[english, ngerman]{babel}            % english and german spelling correction
\RequirePackage[babel, german=quotes]{csquotes}     % german quotation
\RequirePackage{geometry}                           % allows to change the layout of a page in a very simple way
\RequirePackage[most]{tcolorbox}                    % provides an environment for coloured and framed text boxes
\RequirePackage{titletoc}                           % alternative headings for toc/lof/lot
\RequirePackage{tikz}                               % allows the creation of graphics
\RequirePackage{acronym}                            % provides logic to implement a list of acronyms
\RequirePackage{enumitem}                           % allows listing
\RequirePackage[style=alphabetic,
    backend=bibtex]{biblatex}                       % backend logic
\RequirePackage{float}                              % improves the interface for defining floating objects such as figures and tables.
\RequirePackage{subfig}                             % allows to more figures to be grouped
\RequirePackage{type1cm}


% for the use in this class
\usepackage{subfig}
\usepackage{graphicx}
\usepackage{float}
\usepackage{xcolor}
\usepackage[most]{tcolorbox}
\usepackage{dirtytalk}
\usepackage{tabularx}
\usepackage{subfig}
\usepackage{type1cm}

%###################################################################################################
%#                                        COLOR DEFINITIONS                                        #
%###################################################################################################
\definecolor{HS_green}{HTML}{288733}
\definecolor{PA_blue}{HTML}{006ab3}


%###################################################################################################
%#                                      CONSTANTS DEFINITIONS                                      #
%###################################################################################################
\def\title#1{\gdef\@title{#1}}                                          % title
\def\subtitle#1{\gdef\@subtitle{#1}}                                    % subtitle
\def\MNR#1{\gdef\@MNR{#1}}                                              % immatriculation number
\def\confidentials#1{\gdef\@confidentials{#1}}                          % confidentials
\def\tutorEnterprise#1{\gdef\@tutorEnterprise{#1}}                      % tutor Enterprise
\def\tutorUniversity#1{\gdef\@tutorUniversity{#1}}                      % tutorUniversity
\def\enterprise#1{\gdef\@enterprise{#1}}                                % enterprise
\def\abstractDE#1{\gdef\@abstractDE{#1}}                                % abstract german
\def\abstractEN#1{\gdef\@abstractEN{#1}}                                % abstract english
\def\schluesselwoerter#1{\gdef\@schluesselwoerter{#1}}                  % keywords german
\def\keywords#1{\gdef\@keywords{#1}}                                    % keywords english


%###################################################################################################
%#                                           PAGE STYLE                                            #
%###################################################################################################
\makepagestyle{defaultPageStyle}

% HEADER - EVEN                                           
\makeevenhead{defaultPageStyle}
{\includegraphics[height=1.0cm]{images/Logos/HKA_EIT_Logo.jpg}}
{\Large\sffamily\color{HS_green}\small\textit{\@subtitle}\newline\rule{0.45\linewidth}{0.2mm} \vfill}
{\includegraphics[height=1.0cm]{images/Logos/HKA_EIT_Logo.jpg}\hspace{15mm}}

% HEADER - ODD   
\makeoddhead{defaultPageStyle}
{\includegraphics[height=1.0cm]{images/Logos/HKA_EIT_Logo.jpg}}
{\Large\sffamily\color{HS_green}\small\textit{\@subtitle}\newline\rule{0.45\linewidth}{0.2mm} \vfill }
{\includegraphics[height=1.0cm]{images/Logos/HKA_EIT_Logo.jpg}\hspace{15mm}}

% FOOTER - EVEN
\makeevenfoot{defaultPageStyle}
{\vfill \sffamily\color{HS_green} \emph{ \@author}}
{\color{HS_green}{\hspace{0.3cm}{\color{HS_green} \large\sffamily \thepage }\hspace{0.3cm}}}

% FOOTER - ODD
\makeoddfoot{defaultPageStyle}
{\vfill \sffamily\color{HS_green} \emph{ \@author}}
{\color{HS_green}{\hspace{0.3cm}{\color{HS_green} \large\sffamily \thepage }\hspace{0.3cm}}}

% use of this page style
\pagestyle{defaultPageStyle}


%###################################################################################################
%#                                          CHAPTER STYLE                                          #
%###################################################################################################
\makechapterstyle{defaultChapterStyle}{%
    %\chapterstyle{default}
    \setlength\beforechapskip{-15mm}
    \setlength\afterchapskip{5mm}
    \renewcommand*{\chapnumfont}{\sffamily\HUGE\bfseries\color{HS_green}}
    \renewcommand*{\chaptitlefont}{\sffamily\HUGE\bfseries\color{HS_green}}
    \renewcommand*{\printchaptername}{}
    \renewcommand*{\chapternamenum}{}
    \renewcommand*{\printchapternum}{}
    \renewcommand*{\printchaptertitle}[1]{%
        \thispagestyle{defaultPageStyle}
        \chapnumfont \thechapter. \chaptitlefont ##1
        \par\nobreak
    }
}
\chapterstyle{defaultChapterStyle}


%###################################################################################################
%#                                         HEADLINE STYLE                                          #
%###################################################################################################
\chapterstyle{defaultChapterStyle}                                          % chapter headlines
\setsecheadstyle{\sffamily\LARGE\bfseries\color{HS_green}}      % style of \section
\setsubsecheadstyle{\sffamily\Large\bfseries\color{HS_green}}   % style of \subsection
\setsecnumdepth{subsection}                                     % numbers of the subsection
\setsecnumformat{\csname the#1\endcsname\enskip\enskip}         % style sections and subsections
\setsubsubsecheadstyle{\sffamily\large\color{HS_green}}         % style subsubsection


%###################################################################################################
%#                                     TABLES OF CONTENT STYLE                                     #
%###################################################################################################
% change ToC headline style
\renewcommand\tableofcontents{
    \vspace*{3mm}
    {\centering\LARGE Inhaltverzeichnis}\par
    \vspace*{3mm}
    \@starttoc{toc}
}

% set ToC depth:
\settocdepth{subsection}

% pagestyle of ToC first page:
\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{defaultPageStyle}}}

% style of chapter titles:
\renewcommand{\cftchapterafterpnum}{\par\smallskip\hrule\par\smallskip}

% style of section titles:
\titlecontents{section}[1.8em]{\smallskip\sffamily\bfseries\normalsize}
{\thecontentslabel.\enspace}{}{\hfill\contentspage}

%style of subsection titles:
\titlecontents{subsection}[4.1em]{\smallskip\sffamily\normalsize}
{\thecontentslabel\enspace}{}{\hfill\contentspage}


%###################################################################################################
%#                                     PAGE STYLE OF APPENDIX                                      #
%###################################################################################################
\makechapterstyle{appendixPageStyle}{%
    %\chapterstyle{default}
    \setlength{\beforechapskip}{0pt}
    \renewcommand*{\chapnumfont}{\sffamily\HUGE\bfseries\color{HS_green}}
    \renewcommand*{\chaptitlefont}{\sffamily\HUGE\bfseries\color{HS_green}}

    \renewcommand*{\printchaptername}{}

    \renewcommand*{\chapternamenum}{}
    \renewcommand*{\printchapternum}{}

    \renewcommand*{\printchaptertitle}[1]{%
        \thispagestyle{defaultPageStyle}
        \chaptitlefont ##1
    }
}
\newcommand{\ChangePageStyleToAppendix}{
    \setsecnumdepth{none}
    \maxsecnumdepth{none}
    \chapterstyle{appendixPageStyle}
}

%###################################################################################################
%#                                           TITLE PAGE                                            #
%###################################################################################################
\renewcommand{\maketitle}{

    \begingroup
    % definition Marge und Policenfamilie
    \newgeometry{
        top=1cm,
        bottom=1cm,
        right=3cm,
        left=3cm}
    \sffamily

    % \AlCentroPagina{} % Hintergrundbild

    % Logo of HKA and enterprise
    \begin{figure}
        \centering
        \subfloat{{\includegraphics[height=2cm]{images/Logos/HKA_EIT_Logo.jpg} }}
        \hspace{2cm}
        \subfloat{{\includegraphics[height=2cm]{images/Logos/HKA_EIT_Logo.jpg} }}
    \end{figure}

    % Titelbox
    \vspace{2cm}
    \centering
    \begin{tcolorbox}[colback=white,
            breakable, enhanced,colframe=HS_green]
        \centering
        \vspace*{1cm}
        {\HUGE\bfseries{\begin{Spacing}{1.5}\textcolor{HS_green}{\@title}\end{Spacing}}}
        \@ifundefined{@subtitle}{}{\vspace{3ex}\large\textcolor{HS_green}{\@subtitle}}
        \vspace{1cm}
    \end{tcolorbox}
    \vfill

    % informations:
    \begin{flushright}
        \color{HS_green}
        \begin{center}
            {\LARGE\bfseries\textsc{\@author}} \\[1.5cm]
            \fontsize{200pt}{40pt}
            \raggedleft\color{black}
            \begin{tabular}{ r l }
                { Immatrikulationsnummer:}       & { \@MNR}             \\[0.35cm]
                { Unternehmen:         }         & { \@enterprise}      \\[0.35cm]
                { Betreuer am Arbeitsplatz:  }   & { \@tutorEnterprise} \\[0.35cm]
                { Betreuer an der Hochschule:  } & { \@tutorUniversity} \\[0.35cm]
            \end{tabular}
        \end{center}
        \vspace*{5ex}
    \end{flushright}

    \thispagestyle{empty}   % no header and footer
    \endgroup
}

% new layout which comes after the titlepage
\newgeometry{
    left=2.5cm,
    right=2.5cm,
    top=3cm,
    bottom=2cm,
    head=40pt
}
\sffamily
\pagestyle{defaultPageStyle}


%###################################################################################################
%#                                          ABSTRACT PAGE                                          #
%###################################################################################################
\newcommand{\makeabstractpageGER}{
    %\newpage
    \centering
    \vspace*{5ex}

    % abstract in german
    \begin{tcolorbox}[colback=white,
            breakable, enhanced,
            colframe = HS_green!100!white,
            title = Zusammenfassung]
        \vspace{1ex}
        \large
        \@abstractDE\\
        \vfill
        \textbf{Schlüsselwörter:} \newline
        \@schluesselwoerter
        \vspace{2mm}
    \end{tcolorbox}
    \clearpage
}

\newcommand{\makeabstractpageENG}{
    %\newpage
    \centering
    \vspace*{5ex}

    % abstract in english
    \begin{tcolorbox}[colback=white,
            breakable, enhanced,
            colframe = HS_green!100!white,
            title = Abstract]
        \vspace{1ex}
        \large
        \@abstractEN\\
        \vfill
        \textbf{Keywords:} \newline
        \@keywords
        \vspace{2mm}
    \end{tcolorbox}
    \clearpage
}