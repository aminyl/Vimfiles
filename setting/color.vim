"=============================================================================
"カラー設定(colorschemeの設定前に書くこと)
"=============================================================================
autocmd ColorScheme * highlight LineNr ctermfg=22 guifg=#325c32 guibg=#1b1d1e   " 行番号
autocmd ColorScheme * highlight Comment ctermfg=22 guifg=#00ff00                " コメント
autocmd ColorScheme * highlight NonText ctermfg=22 guifg=#325c32 guibg=#1b1d1e  " 文章の終わり部分
autocmd ColorScheme * highlight rubyClassDeclaration ctermfg=22 guifg=#2ca7b8   " クラス
autocmd ColorScheme * highlight rubyBlockParameterList ctermfg=22 guifg=#82FA58 " {|x| のパイプ
autocmd ColorScheme * highlight rubyBlockParameter ctermfg=22 guifg=#F7D358     " {|x| のx
autocmd ColorScheme * highlight rubyTodo ctermfg=22 guifg=#9A2EFE               " TODO, FIXME, OPTIMIZE
autocmd ColorScheme * highlight SignColumn ctermfg=22 guifg=#325c32 guibg=#1b1d1e   " 行番号の左，ShowMarksで使うとこ

autocmd ColorScheme * highlight rubyRegexpDelimiter ctermfg=22 guifg=#ff6464    " 正規表現の/
" autocmd ColorScheme * highlight rubyStringDelimiter ctermfg=22 guifg=#dc9632
autocmd ColorScheme * highlight rubyStringDelimiter ctermfg=22 guifg=#ff6464    " "
autocmd ColorScheme * highlight rubyString ctermfg=22 guifg=#ff984d             " 文字列

autocmd ColorScheme * highlight rubyInstanceVariable ctermfg=22 guifg=#9ad35e   " @変数

autocmd ColorScheme * highlight rubyRepeat ctermfg=22 guifg=#ff3d7a             " while, for end
autocmd ColorScheme * highlight rubyControl ctermfg=22 guifg=#ff3d7a            "do end
autocmd ColorScheme * highlight rubyConditionalModifier ctermfg=22 guifg=#ff3d7a    " break if の if
autocmd ColorScheme * highlight rubyConditional ctermfg=22 guifg=#ff3d7a        " if else end 
autocmd ColorScheme * highlight rubyAttribute ctermfg=22 guifg=#ff3c3c          " attr_accessor

let g:molokai_original = 0 " デフォルトは0，他は1"
" let g:rehash256 = 1 "256色モード(違いがわからない)
colorscheme molokai
