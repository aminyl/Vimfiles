" =============================================================================
" カラー設定(colorschemeの設定前に書くこと)
" =============================================================================
autocmd ColorScheme * highlight LineNr ctermfg=22 guifg=#325c32 guibg=#1b1d1e   " 行番号
autocmd ColorScheme * highlight Comment ctermfg=22 guifg=#00ff00                " コメント
autocmd ColorScheme * highlight NonText ctermfg=22 guifg=#325c32 guibg=#1b1d1e  " 文章の終わり部分
autocmd ColorScheme * highlight rubyString ctermfg=22 guifg=#dc9632             " 文字列
autocmd ColorScheme * highlight rubyStringDelimiter ctermfg=22 guifg=#dc9632
autocmd ColorScheme * highlight rubyClassDeclaration ctermfg=22 guifg=#2ca7b8   " クラス
autocmd ColorScheme * highlight rubyBlockParameterList ctermfg=22 guifg=#82FA58 " {|x| のパイプ
autocmd ColorScheme * highlight rubyBlockParameter ctermfg=22 guifg=#F7D358     " {|x| のx
autocmd ColorScheme * highlight rubyTodo ctermfg=22 guifg=#9A2EFE               " TODO, FIXME, OPTIMIZE
autocmd ColorScheme * highlight SignColumn ctermfg=22 guifg=#325c32 guibg=#1b1d1e   " 行番号の左，ShowMarksで使うとこ

let g:molokai_original = 0 " デフォルトは0，他は1"
" let g:rehash256 = 1 "256色モード(違いがわからない)

colorscheme molokai

