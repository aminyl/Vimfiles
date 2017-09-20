" 対応する括弧を自動入力
imap { {}<LEFT>
" imap [ []<LEFT>
" imap ( ()<LEFT>
inoremap {<CR> {<CR>}<ESC><UP>o
" inoremap [<CR> [<CR>]<ESC><UP>o
" inoremap (<CR> (<CR>)<ESC><UP>o
" 保存して実行
nnoremap <F5> :w<ENTER>:!ruby %<ENTER>
inoremap <F5> <ESC>:w<ENTER>:!ruby %<ENTER><ESC>a
inoremap jj <ESC>				" エスケープ
nnoremap <ESC><ESC> :nohlsearch<CR> " <ESC>連打でハイライトを消す
" いっぱい移動する
nnoremap J 5j
nnoremap K 5k
vnoremap J 5j
vnoremap K 5k
" nnoremap t <C-t>  " タグ関係
nnoremap se ggVG=   " フォーマット
map Y y$		        " Yの動作をDやCと同じにする
imap <S-Del> <ESC>ddi
imap <C-c> <ESC>yyi
nmap <C-c> yy
" 行入れ替え
imap <M-k> <ESC>ddkPi
imap <M-j> <ESC>ddpi
imap <M-Up> <ESC>ddkPi
imap <M-Down> <ESC>ddpi
nmap <M-k> ddkP
nmap <M-j> ddp
nmap <M-Up> ddkP
nmap <M-Down> ddp
imap <C-Right> <ESC>ewi
nmap <C-Right> w
imap <C-Left> <ESC>gebi
nmap <C-Left> b
" 変更履歴区切り
" http://haya14busa.com/vim-break-undo-sequence-in-insertmode/
inoremap <Space> <Space><C-g>u
inoremap <Tab> <Tab><C-g>u
inoremap <CR> <CR><C-g>u
