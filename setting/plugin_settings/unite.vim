let g:unite_enable_start_insert = 1        " 最初からinsertモードにしておく
let g:unite_source_history_yank_enable = 1 " ヤンク履歴とか使えるようにする
let g:unite_source_history_yank_limit = 100 " 履歴の最大を設定

" , にショートカットを割り振っておく
" Everythingを起動している必要あり、加えて別途es.exeをDLしてパスを通す
nnoremap <silent> ,a  :<C-u>Unite everything/async -buffer-name=everything<CR>
" 最近開いたファイルとかその他諸々(かなり高速)
nnoremap <silent> ,f :<C-u>Unite buffer file_mru file -buffer-name=searcher<CR>
" ヤンク(コピー履歴)
nnoremap <silent> ,z :<C-u>Unite history/yank -buffer-name=history/yank<CR>
" grep結果, :Unite grep:(パス)
nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" <C-l>でウィンドウ分割して開く, <C-o>でタブで開く
" au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('tabopen')
au FileType unite inoremap <silent> <buffer> <expr> <C-o> unite#do_action('tabopen')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" grepはthe platium searcherを使う（速い！） (必須) pt.exe
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif

set grepprg=pt\ --nogroup
