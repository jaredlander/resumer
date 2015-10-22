%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.latextemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[9pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{multicol}

\pagestyle{empty} % Suppress page numbers

\usepackage[left=0.5in,top=0.2in,right=0.5in,bottom=0.2in]{geometry} % Document margins

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\newenvironment{tightcenter}{%
  \setlength\topsep{0pt}
  \setlength\parskip{0pt}
  \begin{center}
}{%
  \end{center}
}

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

%\def \addressSep {$\diamond$} % Set default address separator to a diamond
\def \addressSep {$\cdot$} % Set default address separator to a cdot

% One or two address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax

% \address command can be used to set the first and second address (optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
    \def \@addressone {#1}
  }
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
  \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------
\def \sep {\addressSep\ }
\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  {\centering \MakeUppercase{\namesize\bf \@name} \\}
  \@ifundefined{@addressone}{}{ % Print the first address if specified
    {\centering \@addressone \\}
    }
  \@ifundefined{@addresstwo}{}{ % Print the second address if specified
    {\centering \@addresstwo \\}
    }
    \addressskip \hrule
}

% \let\ori@document=\document
% \renewcommand{\document}{
%   \ori@document  % Begin document
%   \printname \smallskip % Print the name specified with \name
%   \@ifundefined{@addressone}{}{ % Print the first address if specified
%     \printaddress{\@addressone}}
%   \@ifundefined{@addresstwo}{}{ % Print the second address if specified
%     \printaddress{\@addresstwo}}
%   \hrule
% }

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \sectionskip
%  \MakeUppercase{\bf \underline{#1}} % Section title
  \underline{#1} % Section title
%  \sectionlineskip
%  \hrule % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{0.5em} % Margin within the section
  }
  \item[]
}{
  \end{list}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
 {\bf #1} \hfill {#2} % Bold company name and date on the right
 \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
  \\
%  {\em #3} \hfill {\em #4} % Italic job title and location
  {\em #3} \hfill {#4} % Italic job title and location
  }\smallskip
  \begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0.1em} % Some space after the list of bullet points
}

%----------------------------------------------------------------------------------------
%    RESEARCH EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------
\newenvironment{research}[3]{ % 3 input arguments - type, company name, year(s) employed
 {\bf #1} \hfill {\em #2} \hfill {#3} % Bold company name and date on the right
\\ %\smallskip
    }{
\vspace{0.1em} % Some space after the list of bullet points
}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\Large} % Size of the name at the top of the document
\def\addressskip{\medskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\smallskip} % The space above the horizontal line for each section 
\def\nameskip{\smallskip} % The space after your name at the top
\def\sectionskip{\smallskip} % The space after the heading section
