\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{resumer}[2010/07/10 v0.1 ResumeR class]

\LoadClass[9pt,letterpaper]{article} % Font size and paper type

\usepackage{parskip} % Remove paragraph indentation
\pagestyle{empty} % Suppress page numbers

\RequirePackage{titlesec}   % for formatting sections

\usepackage[left=0.5in,top=0.2in,right=0.5in,bottom=0.2in]{geometry} % Document margins

\usepackage{ifthen} % Required for ifthenelse statements

\usepackage{array} % for let command

% center environment
\newenvironment{tightcenter}{%
  \setlength\topsep{0pt}
  \setlength\parskip{0pt}
  \begin{center}
}{%
  \end{center}
}

% name command
\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

% code to print the name
\def \printname {
  \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
  \endgroup
}

% address separator
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

% % \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

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


% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\Large} % Size of the name at the top of the document
\def\addressskip{\medskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\smallskip} % The space above the horizontal line for each section 
\def\nameskip{\smallskip} % The space after your name at the top
\def\sectionskip{\smallskip} % The space after the heading section