\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{resumer}[2010/07/10 v0.1 ResumeR class]

\LoadClass[9pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\pagestyle{empty} % Suppress page numbers

\RequirePackage{titlesec}   % for formatting sections

\titleformat{\section}
    {\Large\raggedright}        % Make the \section headers large {\Large}
                                % left aligned {\raggedright}
    {}{0em}                     % No prefix
    {}                          % for code to insert before heading
    [\titlerule]                % inserts a horizontal rule after the heading

% \titleformat{\subsection}
%     {\large\raggedright}
%     {}{0em}
%     {}
