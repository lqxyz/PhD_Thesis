%%
%% This is file `exeterthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% exeterthesis.dtx  (with options: `class')
%% 
%% ///////////////////////////////////////////////////////////////////
%% 
%% The provided documentclass `exeterthesis' is based on the class `scrreprt'
%% from the Koma-script package. It uses the packages `geometry'
%% and `setspace' to fullfill the requirements for dissertations of
%% the University of London and of Imperial College London.
%% 
%% If you print your dissertation for yourself or as a present for
%% family, friends or colleagues you probably should use a different
%% layout which does not fulfill the College requirements but which
%% looks much better.
%% For further information and for professional layouting and
%% printing services please visit www.PrettyPrinting.net.
%% 
%% ///////////////////////////////////////////////////////////////////
%% 
%% Copyright (c) 2007, Daniel Wagner, www.PrettyPrinting.net
%% 
%% Permission is hereby granted, free of charge, to any person
%% obtaining a copy of this documentclass and associated
%% documentation files (the "Template"), to deal in the Template
%% without restriction, including without limitation the rights to
%% use, copy, modify, merge, publish, distribute, sublicense,
%% and/or sell copies of the Template, and to permit persons to
%% whom the Template is furnished to do so, subject to the
%% following conditions:
%% 
%% The above copyright notice and this permission notice shall be
%% included in all copies or substantial portions of the Template.
%% 
%% THE TEMPLATE IS PROVIDED ``AS IS'', WITHOUT WARRANTY OF ANY KIND,
%% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
%% OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
%% NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
%% HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
%% WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
%% FROM, OUT OF OR IN CONNECTION WITH THE TEMPLATE OR THE USE OR
%% OTHER DEALINGS IN THE TEMPLATE.
%% 
%% ///////////////////////////////////////////////////////////////////
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{exeterthesis}
    [2010/03/26 v2.0 Exeter University Dissertation Template]


\RequirePackage{graphicx}
\newcommand*{\@supervisor}{}
\newcommand*{\@university}{}
\newcommand*{\@college}{University of Exeter}
\newcommand*{\@department}{}
\newcommand*{\@field}{}
\newcommand*{\@degree}{}
\newcommand*{\@diploma}{}
\newcommand*{\@declaration}{}
\DeclareOption{university}{%
 \renewcommand{\@university}{University of Exeter}}
\DeclareOption{imperial}{%
 \let\@university\empty}
\DeclareOption{PhD}{%
 \renewcommand{\@degree}{Doctor of Philosophy}
 \renewcommand{\@diploma}{Diploma of University of Exeter}}
\DeclareOption{MSc}{%
 \renewcommand{\@degree}{Master of Science}\let\@diploma\empty}
\DeclareOption{BSc}{%
 \renewcommand{\@degree}{Bachelor of Science}\let\@diploma\empty}
\DeclareOption{DIC=off}{%
 \let\@diploma\empty}
\DeclareOption{DIC=on}{%
 \renewcommand{\@diploma}{Diploma of University of Exeter}}
\DeclareOption{declaration=off}{%
 \let\@declaration\empty}
\DeclareOption{declaration=on}{%
 \renewcommand{\@declaration}{%
 I herewith certify that all material in this dissertation which
 is not my own work has been properly acknowledged.}}
\DeclareOption{doublespacing}{\AtBeginDocument{\doublespacing}}
\DeclareOption{onehalfspacing}{\AtBeginDocument{\onehalfspacing}}
\DeclareOption{titlepagenumber=off}{%
 \AtEndOfClass{\renewcommand{\titlepagestyle}{empty}}}
\DeclareOption{titlepagenumber=on}{%
 %\AtEndOfClass{\renewcommand{\titlepagestyle}{plain}}}
 \AtEndOfClass{\renewcommand{\titlepagestyle}{empty}}} % Qun
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\ExecuteOptions{% 
	onehalfspacing,titlepagenumber=on,imperial,PhD,declaration=off,a4paper,11pt,twosid}
\ProcessOptions\relax
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand*{\college}[1]{\gdef\@college{#1}}
\newcommand*{\department}[1]{\gdef\@department{#1}}
\newcommand*{\field}[1]{\gdef\@field{#1}}
\newcommand*{\declaration}[1]{\gdef\@declaration{#1}}
\LoadClass{scrreprt}
\RequirePackage{setspace}
\RequirePackage[left=3cm,right=3cm,top=2cm,bottom=2cm]%
 {geometry}
%\setkomafont{sectioning}{\rmfamily\bfseries}
%\setkomafont{sectioning}{\sffamily\bfseries}
\setkomafont{sectioning}{\bfseries}

\renewcommand*{\maketitle}{

\begin{titlepage}
 \par
 \clearpage
 \thispagestyle{\titlepagestyle}
 
 \noindent\begin{minipage}[t]{\textwidth}
  %\centering\large
  \ifx\@university\@empty \else \@university\par\fi
  \centering
  \includegraphics[width=0.6\linewidth]{figs/colour_logo.png}
  %\@college
  %\ifx\@department\@empty \else \par Department of \@department\fi
 \end{minipage}

% \noindent\begin{minipage}[t]{\textwidth}
%   \centering
%   \includegraphics[width=0.5\linewidth]{figs/colour_logo.png}
% \end{minipage}

%  \null\vfill
%  \begin{center}
%   {\titlefont\huge \@title\par}
%   \vskip 3em
%   {\Large \lineskip 0.75em
%   \begin{tabular}[t]{c}
%   \textbf{\@author}
%   \end{tabular}\par}
%   \vskip 1.5em
%   {\Large \@date \par}
%   \vskip \z@ \@plus3fill
%   \ifx\@supervisor\@empty \else
%   {\large Supervised by \@supervisor \par}
%   \fi
%   \vskip 3em
%  \end{center}\par

 %\null\vfill
 \begin{center}
  {\titlefont\Huge \@title\par}
  \vskip 6em
 \end{center}\par
 
 \noindent \centering \begin{minipage}{0.8\textwidth}
  \centering \large
  Submitted by \textbf{\@author}, to the 
  %Submitted by \@author to the
  \ifx\empty\@university{\@college}\else{the \@university}\fi\ \\
  as a thesis for the degree of \\
  \@degree\ in \ifx\empty\@field{\@department}, \else{\@field}\fi\,\\
  \@date.
  \vspace{0.8cm}
 \end{minipage}

 \vskip 12em
 
 \noindent\begin{minipage}[b]{\textwidth}
  \centering
  This thesis is available for library use on the understanding that it
  is copyright material and that no quotation from the thesis may be published
  without proper acknowledgement.
  \vspace{1cm}
  
  I certify that all material in this thesis which is not my own work has
  been identified and that no material has previously been submitted and
  approved for the award of a degree by this or any other University.
 
  % =============  Added by QUN LIU ============= %
  % 2020/10/18
  \vspace{1.5cm}
  \hspace*{1cm} \includegraphics[height=1.0\baselineskip]{figs/QunLiu_signature.png}
  \vspace{-0.6cm}
  % =============  Added by QUN LIU ============= %
  %\begin{flushright}(Signature)
    % It seems with fromsig, the maketitle command does not work...
  	%\fromsig{\includegraphics[scale=0.1]{figs/QunLiu_signature.png}}
  	%\fromsig{\includegraphics[height=1.5\baselineskip]{figs/QunLiu_signature.png}}
  %  .................................................................................................
  %\end{flushright}

  (Signature) ...................................................................
 \end{minipage}

    %  \ifx\@declaration\@empty\else{
    %  \cleardoublepage
    %  \chapter*{Declaration}
    %  %\thispagestyle{plain}
    %  \thispagestyle{empty} % Qun
    %  \@declaration
    %  \par\vspace{3cm}
    %  \hfill\@author
    %  \cleardoublepage
    %  }\fi
\end{titlepage}
}
\newcommand{\makededication}{
 \ifx\@dedication\@empty \else
 \clearpage
 \chapter*{Acknowledgements}
 %\thispagestyle{plain}
 \thispagestyle{empty} % Qun
 \null\vfill
 {\centering \Large \@dedication \par}
 \vskip \z@ \@plus3fill
 \cleardoublepage
 \fi
}
\newcommand{\makedeclaration}{
 \ifx\@declaration\@empty\else{
 \cleardoublepage
 \chapter*{Declaration}
 %\thispagestyle{plain}
 \thispagestyle{empty} % Qun
 \@declaration
 \par\vspace{3cm}
 \hfill\@author
 \cleardoublepage
 }\fi
}
 
\renewenvironment{abstract}{%
%\chapter*{Abstract}\thispagestyle{plain}}{\cleardoublepage}
\chapter*{Abstract}\thispagestyle{empty}}{\cleardoublepage} % Qun
\endinput
%%
%% End of file `exeterthesis.cls'.
