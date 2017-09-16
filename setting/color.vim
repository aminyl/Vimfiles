" カラー設定(colorschemeの設定前に書くこと)
" https://syncer.jp/color-converter
autocmd ColorScheme * highlight LineNr ctermfg=22 guifg=#325c32 guibg=#1b1d1e       " 行番号
autocmd ColorScheme * highlight CursorLineNr term=bold guifg=#027602 ctermfg=22     " 現在の行番号(ハイライト有効時)
autocmd ColorScheme * highlight Comment ctermfg=22 guifg=#00ff00                    " コメント
autocmd ColorScheme * highlight NonText ctermfg=22 guifg=#325c32 guibg=#1b1d1e      " 文章の終わり部分
autocmd ColorScheme * highlight SignColumn ctermfg=22 guifg=#325c32 guibg=#1b1d1e   " 行番号の左，ShowMarksで使うとこ

autocmd ColorScheme * highlight rubyBlockParameterList ctermfg=22 guifg=#82FA58     " { |x| のパイプ
autocmd ColorScheme * highlight rubyBlockParameter ctermfg=22 guifg=#F7D358         " { |x| のx
autocmd ColorScheme * highlight rubyRegexpDelimiter ctermfg=22 guifg=#ff6464        " 正規表現の/
" autocmd ColorScheme * highlight rubyStringDelimiter ctermfg=22 guifg=#dc9632
autocmd ColorScheme * highlight rubyStringDelimiter ctermfg=22 guifg=#ff6464        " "
autocmd ColorScheme * highlight rubyString ctermfg=22 guifg=#ff984d                 " 文字列
autocmd ColorScheme * highlight rubyTodo ctermfg=22 guifg=#9A2EFE                   " TODO, FIXME, OPTIMIZE

autocmd ColorScheme * highlight rubyClassDeclaration ctermfg=22 guifg=#2ca7b8       " クラス
autocmd ColorScheme * highlight rubyInstanceVariable ctermfg=22 guifg=#9ad35e       " @変数
" autocmd ColorScheme * highlight rubyConstant ctermfg=22 guifg=#c300ff             " クラス名 
" autocmd ColorScheme * highlight rubyClassVariable ctermfg=22 guifg=#c300ff        " クラス変数
" autocmd ColorScheme * highlight rubyGlobalVariable ctermfg=22 guifg=#c300ff       " グローバル変数
" autocmd ColorScheme * highlight rubyFunction ctermfg=22 guifg=#c300ff             " 関数名

autocmd ColorScheme * highlight rubyRepeat ctermfg=22 guifg=#ff3d7a                 " while, for end
autocmd ColorScheme * highlight rubyRepeatModifier ctermfg=22 guifg=#ff3d7a         " わからない
autocmd ColorScheme * highlight rubyControl ctermfg=22 guifg=#ff3d7a                "do end
autocmd ColorScheme * highlight rubyConditionalModifier ctermfg=22 guifg=#ff3d7a    " break if の if
autocmd ColorScheme * highlight rubyConditional ctermfg=22 guifg=#ff3d7a            " if else end 
autocmd ColorScheme * highlight rubyAttribute ctermfg=22 guifg=#ff3c3c              " attr_accessor

" autocmd ColorScheme * highlight rubyStringEscape ctermfg=22 guifg=#c300ff         " エスケープシーケンス
" autocmd ColorScheme * highlight rubyQuoteEscape ctermfg=22 guifg=#c300ff          " よくわからない
" autocmd ColorScheme * highlight rubyInterpolation ctermfg=22 guifg=#c300ff        " #{}の中身
" autocmd ColorScheme * highlight rubyInterpolationDelimiter ctermfg=22 guifg=#c300ff " attr_accessor
" autocmd ColorScheme * highlight rubySymbol ctermfg=22 guifg=#c300ff               " :to_i等のシンボル
" autocmd ColorScheme * highlight rubyControl ctermfg=22 guifg=#c300ff              " break, next, return, and, or 等
" autocmd ColorScheme * highlight rubyBoolean ctermfg=22 guifg=#c300ff              " true, false

" autocmd ColorScheme * highlight rubyOperator ctermfg=22 guifg=#c300ff             "
" autocmd ColorScheme * highlight rubyBracketOperator ctermfg=22 guifg=#c300ff      "
" autocmd ColorScheme * highlight rubyLocalVariableOrMethod ctermfg=22 guifg=#c300ff"
" autocmd ColorScheme * highlight rubyBlockArgument ctermfg=22 guifg=#c300ff        "
" autocmd ColorScheme * highlight rubyCapitalizedMethod ctermfg=22 guifg=#c300ff    "
" autocmd ColorScheme * highlight rubyInvalidVariable ctermfg=22 guifg=#c300ff      "
" autocmd ColorScheme * highlight rubyPredefinedVariable ctermfg=22 guifg=#c300ff   "
" autocmd ColorScheme * highlight rubyPredefinedConstant ctermfg=22 guifg=#c300ff   "
" autocmd ColorScheme * highlight rubyAliasDeclaration ctermfg=22 guifg=#c300ff     " 
" autocmd ColorScheme * highlight rubyMethodDeclaration ctermfg=22 guifg=#c300ff    " 
" autocmd ColorScheme * highlight rubyClassDeclaration ctermfg=22 guifg=#c300ff     " 
" autocmd ColorScheme * highlight rubyBeginEnd ctermfg=22 guifg=#c300ff             " 
" autocmd ColorScheme * highlight rubyDefine ctermfg=22 guifg=#c300ff               " 
" autocmd ColorScheme * highlight rubyClass ctermfg=22 guifg=#c300ff                "
" autocmd ColorScheme * highlight rubyMethodBlock ctermfg=22 guifg=#c300ff          "
" autocmd ColorScheme * highlight rubyBlock ctermfg=22 guifg=#c300ff                "
" autocmd ColorScheme * highlight rubyDoBlock ctermfg=22 guifg=#c300ff              "
" autocmd ColorScheme * highlight rubyCurlyBlock ctermfg=22 guifg=#c300ff           "
" autocmd ColorScheme * highlight rubyArrayLiteral ctermfg=22 guifg=#c300ff         " 配列の中の字の色
" autocmd ColorScheme * highlight rubyBlockExpression ctermfg=22 guifg=#c300ff      "
" autocmd ColorScheme * highlight rubyCaseExpression ctermfg=22 guifg=#c300ff       "
" autocmd ColorScheme * highlight rubyConditionalExpression ctermfg=22 guifg=#c300ff"
" autocmd ColorScheme * highlight rubyExceptional ctermfg=22 guifg=#c300ff          "

let g:molokai_original = 0 " デフォルトは0，他は1"
" let g:rehash256 = 1 "256色モード(違いがわからない)
colorscheme molokai
