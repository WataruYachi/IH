%%
%% This is file `tbook.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% jclasses.dtx  (with options: `book,tate')
%% 
%% IMPORTANT NOTICE:
%% 
%% For the copyright see the source file.
%% 
%% Any modified versions of this file must be renamed
%% with new filenames distinct from tbook.cls.
%% 
%% For distribution of the original source see the terms
%% for copying and modification in the file jclasses.dtx.
%% 
%% This generated file may be distributed as long as the
%% original source files, as listed above, are part of the
%% same distribution. (The sources need not necessarily be
%% in the same archive or directory.)
%% File: jclasses.dtx
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%

%% 変更履歴
% 2010/06/20	初期公開
% 2010/11/06	jisfontzoom, jsfontzoom オプション処理実装
% 		\bunkohonbunsizeを 11〜13bQ に変えられるようにする。
% 2011/01/22	ページサイズのカウントを並べ替え。
% 		\bH が 0mm になっていたのを修正。
% 		\chapter ありのページで、行が揃うように、\vbox で囲む。
% 2011/06/18	\bunkohonbunsize, \bunkorubysize の行送りを \bH→trueH に。
% 		\fontsize級数 命令追加。
% 		\chapter の文字の大きさを 18級に変更。
% 2012/05/12	\nibuskip, \sibusukip 追加
% 2012/05/12	改行や\noindentの後の行頭括弧が揃うようにする
% 2014/03/29	\fontsize級数を60Qまで追加。
% 		単位に \bbp追加。本文サイズに 7〜11bbp追加。

\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{tbook}
  [1999/05/18 v1.1q Standard pLaTeX class]
\newcounter{@paper}
\newif\if@landscape \@landscapefalse
\newcommand{\@ptsize}{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\hour\time \divide\hour by 60\relax
\@tempcnta\hour \multiply\@tempcnta 60\relax
\minute\time \advance\minute-\@tempcnta
\newif\if@stysize \@stysizefalse
\newif\if@enablejfam \@enablejfamtrue
\DeclareOption{a4paper}{\setcounter{@paper}{1}%
  \setlength\paperheight {297mm}%
  \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}{\setcounter{@paper}{2}%
  \setlength\paperheight {210mm}
  \setlength\paperwidth  {148mm}}
\DeclareOption{b4paper}{\setcounter{@paper}{3}%
  \setlength\paperheight {364mm}
  \setlength\paperwidth  {257mm}}
\DeclareOption{b5paper}{\setcounter{@paper}{4}%
  \setlength\paperheight {257mm}
  \setlength\paperwidth  {182mm}}
\DeclareOption{b6paper}{\setcounter{@paper}{5}%
  \setlength\paperheight {182mm}
  \setlength\paperwidth  {128mm}}
\DeclareOption{a6paper}{\setcounter{@paper}{6}%
  \setlength\paperheight {148mm}
  \setlength\paperwidth  {105mm}}
\DeclareOption{a4j}{\setcounter{@paper}{1}\@stysizetrue
  \setlength\paperheight {297mm}%
  \setlength\paperwidth  {210mm}}
\DeclareOption{a5j}{\setcounter{@paper}{2}\@stysizetrue
  \setlength\paperheight {210mm}
  \setlength\paperwidth  {148mm}}
\DeclareOption{b4j}{\setcounter{@paper}{3}\@stysizetrue
  \setlength\paperheight {364mm}
  \setlength\paperwidth  {257mm}}
\DeclareOption{b5j}{\setcounter{@paper}{4}\@stysizetrue
  \setlength\paperheight {257mm}
  \setlength\paperwidth  {182mm}}
\DeclareOption{a4p}{\setcounter{@paper}{1}\@stysizetrue
  \setlength\paperheight {297mm}%
  \setlength\paperwidth  {210mm}}
\DeclareOption{a5p}{\setcounter{@paper}{2}\@stysizetrue
  \setlength\paperheight {210mm}
  \setlength\paperwidth  {148mm}}
\DeclareOption{b4p}{\setcounter{@paper}{3}\@stysizetrue
  \setlength\paperheight {364mm}
  \setlength\paperwidth  {257mm}}
\DeclareOption{b5p}{\setcounter{@paper}{4}\@stysizetrue
  \setlength\paperheight {257mm}
  \setlength\paperwidth  {182mm}}
\if@compatibility
  \renewcommand{\@ptsize}{0}
\else
  \DeclareOption{10pt}{\renewcommand{\@ptsize}{0}}
\fi
\DeclareOption{9pt}{\renewcommand{\@ptsize}{-1}}
\DeclareOption{10pt}{\renewcommand{\@ptsize}{0}}
\DeclareOption{11pt}{\renewcommand{\@ptsize}{1}}
\DeclareOption{12pt}{\renewcommand{\@ptsize}{2}}
\DeclareOption{14pt}{\renewcommand{\@ptsize}{4}}
\DeclareOption{17pt}{\renewcommand{\@ptsize}{7}}
\DeclareOption{20pt}{\renewcommand{\@ptsize}{10}}
\DeclareOption{21pt}{\renewcommand{\@ptsize}{11}}
\DeclareOption{25pt}{\renewcommand{\@ptsize}{15}}
\DeclareOption{30pt}{\renewcommand{\@ptsize}{20}}
\DeclareOption{36pt}{\renewcommand{\@ptsize}{26}}
\DeclareOption{43pt}{\renewcommand{\@ptsize}{33}}
\DeclareOption{12Q}{\renewcommand{\@ptsize}{1200}}
\DeclareOption{14Q}{\renewcommand{\@ptsize}{1400}}
\DeclareOption{landscape}{\@landscapetrue
  \setlength\@tempdima{\paperheight}%
  \setlength\paperheight{\paperwidth}%
  \setlength\paperwidth{\@tempdima}}
\DeclareOption{tombow}{%
  \tombowtrue \tombowdatetrue
  \setlength{\@tombowwidth}{.1\p@}%
  \@bannertoken{%
     \jobname\space:\space\number\year/\number\month/\number\day
      (\number\hour:\number\minute)}
  \maketombowbox}
\DeclareOption{tombo}{%
  \tombowtrue \tombowdatefalse
  \setlength{\@tombowwidth}{.1\p@}%
  \maketombowbox}
\DeclareOption{mentuke}{%
  \tombowtrue \tombowdatefalse
  \setlength{\@tombowwidth}{\z@}%
  \maketombowbox}
\DeclareOption{tate}{%
  \AtBeginDocument{\tate\message{《縦組モード》}%
                   \adjustbaseline}%
}
\DeclareOption{oneside}{\@twosidefalse}
\DeclareOption{twoside}{\@twosidetrue}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}
\if@compatibility
\@openrighttrue
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}}
\if@compatibility
\else
  \DeclareOption{disablejfam}{\@enablejfamfalse}
\fi
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}

% 文字サイズ指定用級サイズ定義
\newdimen\bQ% 文字サイズ指定用級
\newdimen\bH% 文字サイズ指定用歯
\newdimen\bbp% 文字サイズ指定用bp

\DeclareOption{jisfontzoom}{% MIN10/JIS/OTF用サイズ調整
\bQ=0.2598169226truemm% 0.25/0.962216 = 0.2598169226
\bbp=1.03926769truebp}% 1/0.962216
% デフォルト↑
\DeclareOption{jsfontzoom}{% jsclasses/morisawa.sty用サイズ調整
\bQ=0.270361754truemm% 0.25/0.924687 = 0.270361754
\bbp=1.08144702truebp}% 1/0.924687

\let\bH=\bQ
%\newdimen\bH \bH=\bQ
% 0.25/0.924687 = 0.270361754,  12/0.924687 = 12.9774

% 文庫本文サイズ、ルビサイズ定義
% デフォルト 12級
\newcommand{\bunkohonbunsize}{\@setfontsize\bunkohonbunsize{12\bQ}{19trueH}}
\newcommand{\bunkorubysize}{\@setfontsize\bunkorubysize{6\bQ}{10trueH}}

\DeclareOption{11bQ}{%
\renewcommand{\bunkohonbunsize}{\@setfontsize\bunkohonbunsize{11\bQ}{19trueH}}%
\renewcommand{\bunkorubysize}{\@setfontsize\bunkorubysize{5.5\bQ}{10trueH}}}
\DeclareOption{11.5bQ}{%
\renewcommand{\bunkohonbunsize}{\@setfontsize\bunkohonbunsize{11.5\bQ}{19trueH}}%
\renewcommand{\bunkorubysize}{\@setfontsize\bunkorubysize{5.75\bQ}{10trueH}}}
\DeclareOption{12bQ}{%
\renewcommand{\bunkohonbunsize}{\@setfontsize\bunkohonbunsize{12\bQ}{19trueH}}%
\renewcommand{\bunkorubysize}{\@setfontsize\bunkorubysize{6\bQ}{10trueH}}}
\DeclareOption{12.5bQ}{%
\renewcommand{\bunkohonbunsize}{\@setfontsize\bunkohonbunsize{12.5\bQ}{19trueH}}%
\renewcommand{\bunkorubysize}{\@setfontsize\bunkorubysize{6.25\bQ}{10trueH}}}
\DeclareOption{13bQ}{%
\renewcommand{\bunkohonbunsize}{\@setfontsize\bunkohonbunsize{13\bQ}{19trueH}}%
\renewcommand{\bunkorubysize}{\@setfontsize\bunkorubysize{6.5\bQ}{10trueH}}}

\DeclareOption{7bbp}{%
\renewcommand{\bunkohonbunsize}{\@setfontsize\bunkohonbunsize{7\bbp}{12truebp}}%
\renewcommand{\bunkorubysize}{\@setfontsize\bunkorubysize{3.5\bbp}{7truebp}}}
\DeclareOption{7.5bbp}{%
\renewcommand{\bunkohonbunsize}{\@setfontsize\bunkohonbunsize{7.5\bbp}{12truebp}}%
\renewcommand{\bunkorubysize}{\@setfontsize\bunkorubysize{3.75\bbp}{7truebp}}}
\DeclareOption{8bbp}{%
\renewcommand{\bunkohonbunsize}{\@setfontsize\bunkohonbunsize{8\bbp}{12truebp}}%
\renewcommand{\bunkorubysize}{\@setfontsize\bunkorubysize{4\bbp}{7truebp}}}
\DeclareOption{8.5bbp}{%
\renewcommand{\bunkohonbunsize}{\@setfontsize\bunkohonbunsize{8.5\bbp}{14truebp}}%
\renewcommand{\bunkorubysize}{\@setfontsize\bunkorubysize{4.25\bbp}{7truebp}}}
\DeclareOption{9bbp}{%
\renewcommand{\bunkohonbunsize}{\@setfontsize\bunkohonbunsize{9\bbp}{14truebp}}%
\renewcommand{\bunkorubysize}{\@setfontsize\bunkorubysize{4.5\bbp}{8truebp}}}
\DeclareOption{9.5bbp}{%
\renewcommand{\bunkohonbunsize}{\@setfontsize\bunkohonbunsize{9.5\bbp}{14truebp}}%
\renewcommand{\bunkorubysize}{\@setfontsize\bunkorubysize{4.75\bbp}{8truebp}}}
\DeclareOption{10bbp}{%
\renewcommand{\bunkohonbunsize}{\@setfontsize\bunkohonbunsize{10\bbp}{16truebp}}%
\renewcommand{\bunkorubysize}{\@setfontsize\bunkorubysize{5\bbp}{10truebp}}}
\DeclareOption{10.5bbp}{%
\renewcommand{\bunkohonbunsize}{\@setfontsize\bunkohonbunsize{10.5\bbp}{16truebp}}%
\renewcommand{\bunkorubysize}{\@setfontsize\bunkorubysize{5.25\bbp}{10truebp}}}
\DeclareOption{11bbp}{%
\renewcommand{\bunkohonbunsize}{\@setfontsize\bunkohonbunsize{11\bbp}{18truebp}}%
\renewcommand{\bunkorubysize}{\@setfontsize\bunkorubysize{5.5\bbp}{10truebp}}}


% 各種フォントサイズ設定
\newcommand{\fontsizeI}{\@setfontsize\fontsizeI{1\bQ}{2trueH}}
\newcommand{\fontsizeII}{\@setfontsize\fontsizeII{2\bQ}{3trueH}}
\newcommand{\fontsizeIII}{\@setfontsize\fontsizeIII{3\bQ}{6trueH}}
\newcommand{\fontsizeIV}{\@setfontsize\fontsizeIV{4\bQ}{6trueH}}
\newcommand{\fontsizeV}{\@setfontsize\fontsizeV{5\bQ}{10trueH}}
\newcommand{\fontsizeVI}{\@setfontsize\fontsizeVI{6\bQ}{10trueH}}
\newcommand{\fontsizeVII}{\@setfontsize\fontsizeVII{7\bQ}{15trueH}}
\newcommand{\fontsizeVIII}{\@setfontsize\fontsizeVIII{8\bQ}{15trueH}}
\newcommand{\fontsizeIX}{\@setfontsize\fontsizeIX{9\bQ}{15trueH}}
\newcommand{\fontsizeX}{\@setfontsize\fontsizeX{10\bQ}{15trueH}}
\newcommand{\fontsizeXI}{\@setfontsize\fontsizeXI{11\bQ}{19trueH}}
\newcommand{\fontsizeXII}{\@setfontsize\fontsizeXII{12\bQ}{19trueH}}
\newcommand{\fontsizeXIII}{\@setfontsize\fontsizeXIII{13\bQ}{19trueH}}
\newcommand{\fontsizeXIV}{\@setfontsize\fontsizeXIV{14\bQ}{19trueH}}
\newcommand{\fontsizeXV}{\@setfontsize\fontsizeXV{15\bQ}{30trueH}}
\newcommand{\fontsizeXVI}{\@setfontsize\fontsizeXVI{16\bQ}{30trueH}}
\newcommand{\fontsizeXVII}{\@setfontsize\fontsizeXVII{17\bQ}{30trueH}}
\newcommand{\fontsizeXVIII}{\@setfontsize\fontsizeXVIII{18\bQ}{30trueH}}
\newcommand{\fontsizeXIX}{\@setfontsize\fontsizeXIX{19\bQ}{30trueH}}
\newcommand{\fontsizeXX}{\@setfontsize\fontsizeXX{20\bQ}{30trueH}}
\newcommand{\fontsizeXXI}{\@setfontsize\fontsizeXXI{21\bQ}{50trueH}}
\newcommand{\fontsizeXXII}{\@setfontsize\fontsizeXXII{22\bQ}{50trueH}}
\newcommand{\fontsizeXXIII}{\@setfontsize\fontsizeXXIV{23\bQ}{50trueH}}
\newcommand{\fontsizeXXIV}{\@setfontsize\fontsizeXXIV{24\bQ}{50trueH}}

\newcommand{\fontsizeXXV}{\@setfontsize\fontsizeXXV{25\bQ}{60trueH}}
\newcommand{\fontsizeXXVI}{\@setfontsize\fontsizeXXVI{26\bQ}{60trueH}}
\newcommand{\fontsizeXXVII}{\@setfontsize\fontsizeXXVII{27\bQ}{60trueH}}
\newcommand{\fontsizeXXVIII}{\@setfontsize\fontsizeXXVIII{28\bQ}{60trueH}}
\newcommand{\fontsizeXXIX}{\@setfontsize\fontsizeXXIX{29\bQ}{60trueH}}
\newcommand{\fontsizeXXX}{\@setfontsize\fontsizeXXX{30\bQ}{60trueH}}
\newcommand{\fontsizeXXXI}{\@setfontsize\fontsizeXXXI{31\bQ}{80trueH}}
\newcommand{\fontsizeXXXII}{\@setfontsize\fontsizeXXXII{32\bQ}{80trueH}}
\newcommand{\fontsizeXXXIII}{\@setfontsize\fontsizeXXXIII{33\bQ}{80trueH}}
\newcommand{\fontsizeXXXIV}{\@setfontsize\fontsizeXXXIV{34\bQ}{80trueH}}
\newcommand{\fontsizeXXXV}{\@setfontsize\fontsizeXXXV{35\bQ}{80trueH}}
\newcommand{\fontsizeXXXVI}{\@setfontsize\fontsizeXXXVI{36\bQ}{80trueH}}
\newcommand{\fontsizeXXXVII}{\@setfontsize\fontsizeXXXVII{37\bQ}{80trueH}}
\newcommand{\fontsizeXXXVIII}{\@setfontsize\fontsizeXXXVIII{38\bQ}{80trueH}}
\newcommand{\fontsizeXXXIX}{\@setfontsize\fontsizeXXXIX{39\bQ}{80trueH}}
\newcommand{\fontsizeXL}{\@setfontsize\fontsizeXL{40\bQ}{100trueH}}

\newcommand{\fontsizeXLI}{\@setfontsize\fontsizeXLI{41\bQ}{100trueH}}
\newcommand{\fontsizeXLII}{\@setfontsize\fontsizeXLII{42\bQ}{100trueH}}
\newcommand{\fontsizeXLIII}{\@setfontsize\fontsizeXLIII{43\bQ}{100trueH}}
\newcommand{\fontsizeXLIV}{\@setfontsize\fontsizeXLIV{44\bQ}{100trueH}}
\newcommand{\fontsizeXLV}{\@setfontsize\fontsizeXLV{45\bQ}{100trueH}}
\newcommand{\fontsizeXLVI}{\@setfontsize\fontsizeXLVI{46\bQ}{100trueH}}
\newcommand{\fontsizeXLVII}{\@setfontsize\fontsizeXLVII{47\bQ}{100trueH}}
\newcommand{\fontsizeXLVIII}{\@setfontsize\fontsizeXLVIII{48\bQ}{100trueH}}
\newcommand{\fontsizeXLIX}{\@setfontsize\fontsizeXLIX{49\bQ}{100trueH}}
\newcommand{\fontsizeL}{\@setfontsize\fontsizeL{50\bQ}{120trueH}}
\newcommand{\fontsizeLI}{\@setfontsize\fontsizeLI{51\bQ}{120trueH}}
\newcommand{\fontsizeLII}{\@setfontsize\fontsizeLII{52\bQ}{120trueH}}
\newcommand{\fontsizeLIII}{\@setfontsize\fontsizeLIII{53\bQ}{120trueH}}
\newcommand{\fontsizeLIV}{\@setfontsize\fontsizeLIV{54\bQ}{120trueH}}
\newcommand{\fontsizeLV}{\@setfontsize\fontsizeLV{55\bQ}{120trueH}}
\newcommand{\fontsizeLVI}{\@setfontsize\fontsizeLVI{56\bQ}{120trueH}}
\newcommand{\fontsizeLVII}{\@setfontsize\fontsizeLVII{57\bQ}{120trueH}}
\newcommand{\fontsizeLVIII}{\@setfontsize\fontsizeLVIII{58\bQ}{120trueH}}
\newcommand{\fontsizeLIX}{\@setfontsize\fontsizeLIX{59\bQ}{120trueH}}
\newcommand{\fontsizeLX}{\@setfontsize\fontsizeLX{60\bQ}{120trueH}}


\newcommand{\fontsizeIv}{\@setfontsize\fontsizeIv{1.5\bQ}{3trueH}}
\newcommand{\fontsizeIIv}{\@setfontsize\fontsizeIIv{2.5\bQ}{4trueH}}
\newcommand{\fontsizeIIIv}{\@setfontsize\fontsizeIIIv{3.5\bQ}{6trueH}}
\newcommand{\fontsizeIVv}{\@setfontsize\fontsizeIVv{4.5\bQ}{6trueH}}
\newcommand{\fontsizeVv}{\@setfontsize\fontsizeVv{5.5\bQ}{10trueH}}
\newcommand{\fontsizeVIv}{\@setfontsize\fontsizeVIv{6.5\bQ}{10trueH}}
\newcommand{\fontsizeVIIv}{\@setfontsize\fontsizeVIIv{7.5\bQ}{15trueH}}
\newcommand{\fontsizeVIIIv}{\@setfontsize\fontsizeVIIIv{8.5\bQ}{15trueH}}
\newcommand{\fontsizeIXv}{\@setfontsize\fontsizeIXv{9.5\bQ}{15trueH}}
\newcommand{\fontsizeXv}{\@setfontsize\fontsizeXv{10.5\bQ}{15trueH}}
\newcommand{\fontsizeXIv}{\@setfontsize\fontsizeXIv{11.5\bQ}{19trueH}}
\newcommand{\fontsizeXIIv}{\@setfontsize\fontsizeXIIv{12.5\bQ}{19trueH}}
\newcommand{\fontsizeXIIIv}{\@setfontsize\fontsizeXIIIv{13.5\bQ}{19trueH}}
\newcommand{\fontsizeXIVv}{\@setfontsize\fontsizeXIVv{14.5\bQ}{19trueH}}
\newcommand{\fontsizeXVv}{\@setfontsize\fontsizeXVv{15.5\bQ}{30trueH}}
\newcommand{\fontsizeXVIv}{\@setfontsize\fontsizeXVIv{16.5\bQ}{30trueH}}
\newcommand{\fontsizeXVIIv}{\@setfontsize\fontsizeXVIIv{17.5\bQ}{30trueH}}
\newcommand{\fontsizeXVIIIv}{\@setfontsize\fontsizeXVIIIv{18.5\bQ}{30trueH}}
\newcommand{\fontsizeXIXv}{\@setfontsize\fontsizeXIXv{19.5\bQ}{30trueH}}
\newcommand{\fontsizeXXv}{\@setfontsize\fontsizeXXv{20.5\bQ}{30trueH}}
\newcommand{\fontsizeXXIv}{\@setfontsize\fontsizeXXIv{21.5\bQ}{50trueH}}
\newcommand{\fontsizeXXIIv}{\@setfontsize\fontsizeXXIIv{22.5\bQ}{50trueH}}
\newcommand{\fontsizeXXIIIv}{\@setfontsize\fontsizeXXIVv{23.5\bQ}{50trueH}}
\newcommand{\fontsizeXXIVv}{\@setfontsize\fontsizeXXIVv{24.5\bQ}{50trueH}}



\ExecuteOptions{a4paper,10pt,twoside,onecolumn,final,openright,tate,jisfontzoom}
%\ExecuteOptions{a4paper,10pt,twoside,onecolumn,final,openright,tate}
\ProcessOptions\relax
\input{tbk1\@ptsize.clo}
\RequirePackage{plext}
\if@stysize
  \setlength\columnsep{3\Cwd}
\else
  \setlength\columnsep{10\p@}
\fi
\setlength\columnseprule{0\p@}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand{\baselinestretch}{}
\setlength\parskip{0\p@ \@plus \p@}
\setlength\parindent{1\Cwd}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{1}
\setcounter{totalnumber}{3}
\setcounter{dbltopnumber}{2}

% 文庫小説用
\newdimen\@Q\@Q=0.25truemm
\newcommand{\smallrubysize}{\@setfontsize\smallrubysize{4.5}\@vpt}
%\newcommand{\bunkohonbunsize}{\@setfontsize\bunkohonbunsize{13.2\@Q}{22.44\@Q}}
%\newcommand{\bunkorubysize}{\@setfontsize\bunkorubysize{6.6\@Q}{8\@Q}}
% \newcommand{\bunkohonbunsize}{\@setfontsize\bunkohonbunsize{13\@Q}{20.5\@Q}}
% \newcommand{\bunkorubysize}{\@setfontsize\bunkorubysize{6.5\@Q}{9.75\@Q}}

% 章題等のフォント切り換え
%\def\midasifont{\mgfamily}
\def\midasifont{\bfseries}

\renewcommand{\topfraction}{.7}
\renewcommand{\bottomfraction}{.3}
\renewcommand{\textfraction}{.2}
\renewcommand{\floatpagefraction}{.5}
\renewcommand{\dbltopfraction}{.7}
\renewcommand{\dblfloatpagefraction}{.5}
\def\ps@plain{\let\@mkboth\@gobbletwo
   \let\ps@jpl@in\ps@plain
   \let\@oddhead\@empty
   \def\@oddfoot{\reset@font\hfil\thepage\hfil}%
   \let\@evenhead\@empty
   \let\@evenfoot\@oddfoot}
\let\ps@jpl@in\ps@plain
\def\ps@headnombre{\let\@mkboth\@gobbletwo
    \let\ps@jpl@in\ps@headnombre
  \def\@evenhead{\hfil\thepage}%
  \def\@oddhead{\thepage\hfil}%
  \let\@oddfoot\@empty\let\@evenfoot\@empty}
\def\ps@footnombre{\let\@mkboth\@gobbletwo
    \let\ps@jpl@in\ps@footnombre
  \def\@evenfoot{\hfil\thepage}%
  \def\@oddfoot{\thepage\hfil}%
  \let\@oddhead\@empty\let\@evenhead\@empty}
\if@twoside
  \def\ps@headings{\let\ps@jpl@in\ps@headnombre
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{{\leftmark}\hfil\thepage}%
    \def\@oddhead{\thepage\hfil\rightmark}%
    \let\@mkboth\markboth
  \def\chaptermark##1{\markboth{%
     \ifnum \c@secnumdepth >\m@ne
         \if@mainmatter
         \@chapapp\thechapter\@chappos\hskip1zw
         \fi
     \fi
     ##1}{}}%
  \def\sectionmark##1{\markright{%
     \ifnum \c@secnumdepth >\z@ \thesection.\hskip1zw\fi
     ##1}}%
  }
\else % if not twoside
  \def\ps@headings{\let\ps@jpl@in\ps@headnombre
    \let\@oddfoot\@empty
    \def\@oddhead{\thepage\hfil\rightmark}%
    \let\@mkboth\markboth
\def\chaptermark##1{\markright{%
   \ifnum \c@secnumdepth >\m@ne
         \if@mainmatter
       \@chapapp\thechapter\@chappos\hskip1zw
         \fi
   \fi
   ##1}}%
  }
\fi
\if@twoside
  \def\ps@bothstyle{\let\ps@jpl@in\ps@footnombre
    \def\@evenhead{\hfil\leftmark}% right page
    \def\@evenfoot{\hfil\thepage}% right page
    \def\@oddhead{\rightmark\hfil}% left page
    \def\@oddfoot{\thepage\hfil}% left page
  \let\@mkboth\markboth
\def\chaptermark##1{\markboth{%
     \ifnum \c@secnumdepth >\m@ne
         \if@mainmatter
         \@chapapp\thechapter\@chappos\hskip1zw
         \fi
     \fi
     ##1}{}}%
  \def\sectionmark##1{\markright{%
     \ifnum \c@secnumdepth >\z@ \thesection.\hskip1zw\fi
     ##1}}%
  }
\else % if one column
  \def\ps@bothstyle{\let\ps@jpl@in\ps@footnombre
    \def\@oddhead{\rightmark\hfil}%
    \def\@oddfoot{\thepage\hfil}%
    \let\@mkboth\markboth
  \def\chaptermark##1{\markright{%
     \ifnum \c@secnumdepth >\m@ne
         \if@mainmatter
         \@chapapp\thechapter\@chappos\hskip1zw
         \fi
     \fi
     ##1}}%
  }
\fi
\def\ps@myheadings{\let\ps@jpl@in\ps@plain%
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \def\@evenhead{{\leftmark}\hfil\thepage}%
  \def\@oddhead{\thepage\hfil\rightmark}%
  \let\@mkboth\@gobbletwo
  \let\chaptermark\@gobble
  \let\sectionmark\@gobble
}
\if@compatibility
\newenvironment{titlepage}
    {%
      \cleardoublepage
     \if@twocolumn\@restonecoltrue\onecolumn
     \else\@restonecolfalse\newpage\fi
     \thispagestyle{empty}%
     \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn\else\newpage\fi
    }
\else
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi
\def\p@thanks#1{\footnotemark
  \protected@xdef\@thanks{\@thanks
    \protect{\noindent$\m@th^\thefootnote$~#1\protect\par}}}
\if@titlepage
  \newcommand{\maketitle}{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let\thanks\p@thanks
  \let\footnote\thanks
  \vbox to\textheight\bgroup\tate\hsize\textwidth
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\Large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \vfil{\centering\@thanks}\vfil\null
  \egroup
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\p@thanks\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  }%
\else
  \newcommand{\maketitle}{\par
  \begingroup
    \renewcommand{\thefootnote}{\fnsymbol{footnote}}%
    \def\@makefnmark{\hbox{\ifydir $\m@th^{\@thefnmark}$
      \else\hbox{\yoko$\m@th^{\@thefnmark}$}\fi}}%
    \long\def\@makefntext##1{\parindent 1zw\noindent
       \hbox to 2zw{\hss\@makefnmark}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne \@maketitle
      \else \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
     \thispagestyle{jpl@in}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\p@thanks\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  }
  \def\@maketitle{%
  \newpage\null
  \vskip 2em%
  \begin{center}%
  \let\footnote\p@thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par\vskip 1.5em}
\fi
\newcommand*{\chaptermark}[1]{}
\setcounter{secnumdepth}{2}
\newcounter{part}
\newcounter{chapter}
\newcounter{section}[chapter]
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\renewcommand{\thepart}{\rensuji{\@Roman\c@part}}
\renewcommand{\thechapter}{\rensuji{\@arabic\c@chapter}}
%\renewcommand{\thesection}{\thechapter・\rensuji{\@arabic\c@section}}
% 章番号を消す
\renewcommand{\thesection}{\rensuji{\@arabic\c@section}}
\renewcommand{\thesubsection}{\thesection・\rensuji{\@arabic\c@subsection}}
\renewcommand{\thesubsubsection}{%
   \thesubsection・\rensuji{\@arabic\c@subsubsection}}
\renewcommand{\theparagraph}{%
   \thesubsubsection・\rensuji{\@arabic\c@paragraph}}
\renewcommand{\thesubparagraph}{%
   \theparagraph・\rensuji{\@arabic\c@subparagraph}}
\newcommand{\@chapapp}{\prechaptername}
\newcommand{\@chappos}{\postchaptername}
\newcommand\frontmatter{%
  \if@openright \cleardoublepage \else \clearpage \fi
  \@mainmatterfalse\pagenumbering{roman}}
\newcommand{\mainmatter}{%
  \if@openright \cleardoublepage \else \clearpage \fi
  \@mainmattertrue\pagenumbering{arabic}}
\newcommand{\backmatter}{%
  \if@openright \cleardoublepage \else \clearpage \fi
  \@mainmatterfalse}
\newcommand{\part}{%
  \if@openright \cleardoublepage \else \clearpage \fi
  \thispagestyle{empty}%
  \if@twocolumn\onecolumn\@tempswatrue\else\@tempswafalse\fi
  \null\vfil
  \secdef\@part\@spart}
\def\@part[#1]#2{%
  \ifnum \c@secnumdepth >-2\relax
    \refstepcounter{part}%
    \addcontentsline{toc}{part}{%
%      \prepartname\thepart\postpartname\hspace{1em}#1}%
      #1}%
  \else
    \addcontentsline{toc}{part}{#1}%
  \fi
  \markboth{}{}%
  {\centering
   \interlinepenalty\@M\reset@font
   \ifnum \c@secnumdepth >-2\relax
%     \huge\bfseries\prepartname\thepart\postpartname
%     \par\vskip20\p@
%本文中の第?部 表示無くす
   \fi
   \Huge\bfseries\midasifont#2\par}%
   \@endpart}
\def\@spart#1{{%
  \centering
  \interlinepenalty\@M\reset@font
  \Huge\bfseries#1\par}%
  \@endpart}
\def\@endpart{\vfil%\newpage
   \if@twoside\null\thispagestyle{empty}\newpage\fi
   \if@tempswa\twocolumn\fi}
\newcommand{\chapter}{%
  \if@openright\cleardoublepage\else\clearpage\fi
%  pagestyle を jpl@in→使用中の物に
%  \thispagestyle{jpl@in}%
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
    \if@mainmatter
    \refstepcounter{chapter}%
    \typeout{\@chapapp\space\thechapter\space\@chappos}%
    \addcontentsline{toc}{chapter}%
%      {\protect\numberline{\@chapapp\thechapter\@chappos}#1}%
      {\protect #1}% 目次から章表示をなくす
    \else\addcontentsline{toc}{chapter}{#1}\fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \@makechapterhead{#2}\@afterheading}
\def\@makechapterhead#1{%
\vbox to 0\baselineskip{%
\hbox{}%
%  \vskip2\Cvs
  \vskip0.5\Cvs
  {\parindent\z@
   \raggedright
%   \reset@font\huge\midasifont
   \reset@font\fontsizeXVIII\midasifont
   \ifnum \c@secnumdepth >\m@ne
     \setlength\@tempdima{\linewidth}%
    \if@mainmatter
%    \setbox\z@\hbox{\@chapapp\thechapter\@chappos\hskip1zw}%
    \setbox\z@\hbox{\hskip2zw}% %本文中の第?章 表示無くす
     \addtolength\@tempdima{-\wd\z@}%
     \unhbox\z@\nobreak
    \fi
     \vtop{\hsize\@tempdima#1}%
   \else
     #1\relax
%   \fi}\nobreak\vskip3\Cvs}
   \fi}}\nobreak\vskip3\baselineskip%
}
\def\@schapter#1{%
  \@makeschapterhead{#1}\@afterheading
}
\def\@makeschapterhead#1{\hbox{}%
  \vskip2\Cvs
  {\parindent\z@
   \raggedright
   \reset@font\huge\midasifont
   \setlength\@tempdima{\linewidth}%
   \vtop{\hsize\@tempdima#1}}\vskip3\Cvs}
%\newcommand{\section}{\@startsection{section}{1}{6zh}%
%   {1.5\Cvs \@plus.5\Cdp \@minus.2\Cdp}%
%   {.5\Cvs \@plus.3\Cdp}%
%   {\reset@font\Large\midasifont}}
\newcommand{\section}{\@startsection{section}{1}{9zw}%
   {1\baselineskip}%
   {1\baselineskip}%
   {\reset@font\bunkohonbunsize\midasifont}}
\newcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
   {1.5\Cvs \@plus.5\Cdp \@minus.2\Cdp}%
   {.5\Cvs \@plus.3\Cdp}%
   {\reset@font\large\midasifont}}
\newcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
   {1.5\Cvs \@plus.5\Cdp \@minus.2\Cdp}%
   {.5\Cvs \@plus.3\Cdp}%
   {\reset@font\normalsize\midasifont}}
\newcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
   {3.25ex \@plus 1ex \@minus .2ex}%
   {-1em}%
   {\reset@font\normalsize\bfseries}}
\newcommand{\subparagraph}{\@startsection{subparagraph}{5}{\z@}%
   {3.25ex \@plus 1ex \@minus .2ex}%
   {-1em}%
   {\reset@font\normalsize\bfseries}}
\newcommand{\appendix}{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \renewcommand{\@chapapp}{\appendixname}%
  \renewcommand{\@chappos}\space%
  \renewcommand{\thechapter}{\rensuji{\@Alph\c@chapter}}}
\if@twocolumn
  \setlength\leftmargini {2em}
\else
  \setlength\leftmargini {2.5em}
\fi
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv {.5em}
  \setlength\leftmarginvi{.5em}
\else
  \setlength\leftmarginv {1em}
  \setlength\leftmarginvi{1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand{\theenumi}{\rensuji{\@arabic\c@enumi}}
\renewcommand{\theenumii}{\rensuji{(\@alph\c@enumii)}}
\renewcommand{\theenumiii}{\rensuji{\@roman\c@enumiii}}
\renewcommand{\theenumiv}{\rensuji{\@Alph\c@enumiv}}
\newcommand{\labelenumi}{\theenumi}
\newcommand{\labelenumii}{\theenumii}
\newcommand{\labelenumiii}{\theenumiii}
\newcommand{\labelenumiv}{\theenumiv}
\renewcommand{\p@enumii}{\theenumi}
\renewcommand{\p@enumiii}{\theenumi(\theenumii)}
\renewcommand{\p@enumiv}{\p@enumiii\theenumiii}
\renewenvironment{enumerate}
  {\ifnum \@enumdepth >\thr@@\@toodeep\else
   \advance\@enumdepth\@ne
   \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
   \list{\csname label\@enumctr\endcsname}{%
      \iftdir
         \ifnum \@listdepth=\@ne \topsep.5\normalbaselineskip
           \else\topsep\z@\fi
         \parskip\z@ \itemsep\z@ \parsep\z@
         \labelwidth1zw \labelsep.3zw
         \ifnum \@enumdepth=\@ne \leftmargin1zw\relax
           \else\leftmargin\leftskip\fi
         \advance\leftmargin 1zw
      \fi
         \usecounter{\@enumctr}%
         \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}
\newcommand{\labelitemi}{\textbullet}
\newcommand{\labelitemii}{%
  \iftdir
     {\textcircled{~}}
  \else
     {\normalfont\bfseries\textendash}
  \fi
}
\newcommand{\labelitemiii}{\textasteriskcentered}
\newcommand{\labelitemiv}{\textperiodcentered}
\renewenvironment{itemize}
  {\ifnum \@itemdepth >\thr@@\@toodeep\else
   \advance\@itemdepth\@ne
   \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
   \expandafter
   \list{\csname \@itemitem\endcsname}{%
      \iftdir
         \ifnum \@listdepth=\@ne \topsep.5\normalbaselineskip
           \else\topsep\z@\fi
         \parskip\z@ \itemsep\z@ \parsep\z@
         \labelwidth1zw \labelsep.3zw
         \ifnum \@itemdepth =\@ne \leftmargin1zw\relax
           \else\leftmargin\leftskip\fi
         \advance\leftmargin 1zw
      \fi
         \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}
\newenvironment{description}
  {\list{}{\labelwidth\z@ \itemindent-\leftmargin
   \iftdir
     \leftmargin\leftskip \advance\leftmargin3\Cwd
     \rightmargin\rightskip
     \labelsep=1zw \itemsep\z@
     \listparindent\z@ \topskip\z@ \parskip\z@ \partopsep\z@
   \fi
           \let\makelabel\descriptionlabel}}{\endlist}
\newcommand{\descriptionlabel}[1]{%
   \hspace\labelsep\normalfont\bfseries #1}
\newenvironment{verse}
  {\let\\\@centercr
   \list{}{\itemsep\z@ \itemindent -1.5em%
           \listparindent\itemindent
           \rightmargin\leftmargin \advance\leftmargin 1.5em}%
           \item\relax}{\endlist}
\newenvironment{quotation}
  {\list{}{\listparindent 1.5em%
           \itemindent\listparindent
           \rightmargin\leftmargin
           \parsep\z@ \@plus\p@}%
           \item\relax}{\endlist}
\newenvironment{quote}
  {\list{}{\rightmargin\leftmargin}%
           \item\relax}{\endlist}
\newcounter{figure}[chapter]
\renewcommand{\thefigure}{%
  \ifnum\c@chapter>\z@\thechapter{}・\fi\rensuji{\@arabic\c@figure}}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand{\thetable}{%
  \ifnum\c@chapter>\z@\thechapter{}・\fi\rensuji{\@arabic\c@table}}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \iftdir\sbox\@tempboxa{#1\hskip1zw#2}%
    \else\sbox\@tempboxa{#1: #2}%
  \fi
  \ifdim \wd\@tempboxa >\hsize
    \iftdir #1\hskip1zw#2\relax\par
      \else #1: #2\relax\par\fi
  \else
    \global \@minipagefalse
    \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset{equation}{chapter}
\renewcommand{\theequation}{%
  \ifnum\c@chapter>\z@\thechapter.\fi \@arabic\c@equation}
\if@enablejfam
  \DeclareSymbolFont{mincho}{JY1}{mc}{m}{n}
  \DeclareSymbolFontAlphabet{\mathmc}{mincho}
  \SetSymbolFont{mincho}{bold}{JY1}{gt}{m}{n}
  \DeclareMathAlphabet{\mathgt}{JY1}{gt}{m}{n}
  \reDeclareMathAlphabet{\mathrm}{\@mathrm}{\@mathmc}
  \reDeclareMathAlphabet{\mathbf}{\@mathbf}{\@mathgt}
  \jfam\symmincho
\else
  \DeclareRobustCommand{\mathmc}{%
    \@latex@error{Command \noexpand\mathmc invalid with\space
       `disablejfam' class option.}\@eha
  }
  \DeclareRobustCommand{\mathgt}{%
    \@latex@error{Command \noexpand\mathgt invalid with\space
       `disablejfam' class option.}\@eha
  }
\fi
\DeclareOldFontCommand{\mc}{\normalfont\mcfamily}{\mathmc}
\DeclareOldFontCommand{\gt}{\normalfont\gtfamily}{\mathgt}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*{\cal}{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*{\mit}{\@fontswitch\relax\mathnormal}
\setcounter{tocdepth}{2}
\newcommand{\@pnumwidth}{1.55em}
\newcommand{\@tocrmarg}{2.55em}
\newcommand{\@dotsep}{4.5}
\newdimen\toclineskip
\setlength\toclineskip{2\p@}
\newdimen\@lnumwidth
\def\numberline#1{\hbox to\@lnumwidth{#1\hfil}}
\def\@dottedtocline#1#2#3#4#5{\ifnum #1>\c@tocdepth \else
  \vskip\toclineskip \@plus.2\p@
  {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
    \parindent #2\relax\@afterindenttrue
   \interlinepenalty\@M
   \leavevmode
   \@lnumwidth #3\relax
   \advance\leftskip \@lnumwidth \hbox{}\hskip -\leftskip
    {#4}\nobreak\leaders\hbox{$\m@th \mkern \@dotsep mu.\mkern \@dotsep
       mu$}\hfill \nobreak\hbox to\@pnumwidth{%
         \hss\reset@font\rmfamily \normalcolor #5}\par}\fi}
\def\addcontentsline#1#2#3{%
  \protected@write\@auxout
    {\let\label\@gobble \let\index\@gobble \let\glossary\@gobble
\@temptokena{\rensuji{\thepage}}}%
    {\string\@writefile{#1}%
       {\protect\contentsline{#2}{#3}{\the\@temptokena}}}%
}
\newcommand{\tableofcontents}{%
  \if@twocolumn\@restonecoltrue\onecolumn
  \else\@restonecolfalse\fi
  \chapter*{ \vspace{-3.5zh}\centering\Large \contentsname
    \@mkboth{\contentsname}{\contentsname}%
  }\vspace{-10zh}\@starttoc{toc}%
  \if@restonecol\twocolumn\fi
}
\newcommand*{\l@part}[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{1zh \@plus\p@}%
    \begingroup
    \parindent\z@\rightskip\@pnumwidth
    \parfillskip-\@pnumwidth
    {\leavevmode\Large\midasifont
     \setlength\@lnumwidth{4zw}%
     \hspace{1zw}#1\hfil\nobreak
%     \hbox to\@pnumwidth{\hss#2}}\par
     \hbox to\@pnumwidth{\hss}}\par
    \nobreak
    \global\@nobreaktrue
    \everypar{\global\@nobreakfalse\everypar{}}%
     \endgroup
  \fi}
\newcommand*{\l@chapter}[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \addvspace{0.0zh \@plus\p@}%
    \begingroup
      \parindent\z@ \rightskip\@pnumwidth \parfillskip-\rightskip
      \leavevmode\midasifont
      \setlength\@lnumwidth{4zw}%
      \advance\leftskip\@lnumwidth \hskip-\leftskip
%      #1\nobreak\hfil\nobreak\hbox to\@pnumwidth{\hss#2}\par
      #1\nobreak\dotfill\nobreak\hbox to\@pnumwidth{\hss#2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*{\l@section}{\@dottedtocline{1}{1zw}{4zw}}
\newcommand*{\l@subsection}   {\@dottedtocline{2}{2zw}{6zw}}
\newcommand*{\l@subsubsection}{\@dottedtocline{3}{3zw}{8zw}}
\newcommand*{\l@paragraph}    {\@dottedtocline{4}{4zw}{9zw}}
\newcommand*{\l@subparagraph} {\@dottedtocline{5}{5zw}{10zw}}
\newcommand{\listoffigures}{%
  \if@twocolumn\@restonecoltrue\onecolumn
  \else\@restonecolfalse\fi
  \chapter*{\listfigurename
  \@mkboth{\listfigurename}{\listfigurename}}%
  \@starttoc{lof}%
  \if@restonecol\twocolumn\fi
}
\newcommand*{\l@figure}{\@dottedtocline{1}{1zw}{4zw}}
\newcommand{\listoftables}{%
  \if@twocolumn\@restonecoltrue\onecolumn
  \else\@restonecolfalse\fi
  \chapter*{\listtablename
  \@mkboth{\listtablename}{\listtablename}}%
  \@starttoc{lot}%
  \if@restonecol\twocolumn\fi
}
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newcommand{\newblock}{\hskip .11em\@plus.33em\@minus.07em}
\newenvironment{thebibliography}[1]
{\chapter*{\bibname\@mkboth{\bibname}{\bibname}}%
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\settowidth\labelwidth{\@biblabel{#1}}%
         \leftmargin\labelwidth
         \advance\leftmargin\labelsep
         \@openbib@code
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
   \sloppy
   \clubpenalty4000
   \@clubpenalty\clubpenalty
   \widowpenalty4000%
   \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist}
\let\@openbib@code\@empty
\newenvironment{theindex}
  {\if@twocolumn\@restonecolfalse\else\@restonecoltrue\fi
   \columnseprule\z@ \columnsep 35\p@
   \twocolumn[\@makeschapterhead{\indexname}]%
   \@mkboth{\indexname}{\indexname}%
   \thispagestyle{jpl@in}\parindent\z@
   \parskip\z@ \@plus .3\p@\relax
   \let\item\@idxitem}
  {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand{\@idxitem}{\par\hangindent 40\p@}
\newcommand{\subitem}{\@idxitem \hspace*{20\p@}}
\newcommand{\subsubitem}{\@idxitem \hspace*{30\p@}}
\newcommand{\indexspace}{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand{\footnoterule}{%
  \kern-3\p@
  \hrule width .4\columnwidth
  \kern 2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{\parindent 1zw
  \noindent\hbox to 2zw{\hss\@makefnmark}#1}
\newif\if西暦 \西暦false
\def\西暦{\西暦true}
\def\和暦{\西暦false}
\newcount\heisei \heisei\year \advance\heisei-1988\relax
\def\today{{%
  \iftdir
    \if西暦
      \kansuji\number\year 年
      \kansuji\number\month 月
      \kansuji\number\day 日
    \else
      平成\ifnum\heisei=1 元年\else\kansuji\number\heisei 年\fi
      \kansuji\number\month 月
      \kansuji\number\day 日
    \fi
  \else
    \if西暦
      \number\year~年
      \number\month~月
      \number\day~日
    \else
      平成\ifnum\heisei=1 元年\else\number\heisei~年\fi
      \number\month~月
      \number\day~日
    \fi
  \fi}}
\newcommand{\prepartname}{第}
\newcommand{\postpartname}{部}
\newcommand{\prechaptername}{第}
\newcommand{\postchaptername}{章}
\newcommand{\contentsname}{もくじ}
\newcommand{\listfigurename}{図 目 次}
\newcommand{\listtablename}{表 目 次}
\newcommand{\bibname}{関連図書}
\newcommand{\indexname}{索 引}
\newcommand{\figurename}{図}
\newcommand{\tablename}{表}
\newcommand{\appendixname}{付 録}
\pagestyle{headings}
\pagenumbering{arabic}
\raggedbottom
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi
\normalmarginpar
\@mparswitchfalse

% 二分アキ・四分アキ定義
\def\nibuskip{\hskip.5zw plus .125zw minus 0.03125zw}
\def\sibuskip{\hskip.25zw plus .125zw minus 0.03125zw}

%\noindent\null の後で、行頭括弧が揃うようにする
\let\orig@null=\null
\def\null{\orig@null\futurelet\@let@token\@@tondgnewline}

%\noindent の後で、行頭括弧が揃うようにする
\let\orig@noindent=\noindent
\def\noindent{\orig@noindent\futurelet\@let@token\@@tondgnewline}

%改行の後で、行頭括弧が揃うようにする
\def\@tondgnewline{%
  \futurelet\@let@token\@@tondgnewline}
\def\@@tondgnewline{%
  \ifx\@let@token「
    \hskip.5zw\<%
  \else
    \ifx\@let@token（
      \hskip.5zw\<%
    \else
      \ifx\@let@token『
        \hskip.5zw\<%
      \else
        \ifx\@let@token［
          \hskip.5zw\<%
        \else
          \ifx\@let@token“
            \hskip.5zw\<%
          \else
            \ifx\@let@token‘
              \hskip.5zw\<%
            \else
              \ifx\@let@token〈
                \hskip.5zw\<%
              \else
                \ifx\@let@token《
                  \hskip.5zw\<%
                \else
                  \ifx\@let@token【
                    \hskip.5zw\<%
                  \else
                    \ifx\@let@token〔
                      \hskip.5zw\<%
                    \fi
                  \fi
                \fi
              \fi
            \fi
          \fi
        \fi
      \fi
    \fi
  \fi}
\def\@gnewline #1{
  \ifvmode
    \@nolnerr
  \else 
     \unskip \reserved@e {\reserved@f#1}\nobreak \hfil \break \null
    \ignorespaces
  \fi
  \@tondgnewline}



\endinput
%%
%% End of file `tbook.cls'.

%%% Local Variables: 
%%% mode: japanese-latex
%%% TeX-master: "main.tex"
%%% End: 
