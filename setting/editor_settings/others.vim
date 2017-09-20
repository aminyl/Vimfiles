" 最後のカーソル位置を復元する
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
" undo履歴クリア関数
" http://sevenb.jp/wordpress/ura/2015/04/21/vim%E3%81%AEundo%E5%B1%A5%E6%AD%B4%E3%82%92%E3%82%AF%E3%83%AA%E3%82%A2%E3%81%99%E3%82%8B/
command -nargs=0 CLU call <sid>ClearUndo()
function! s:ClearUndo()
  let old_undolevels = &undolevels
  set undolevels=-1
  exe "normal a \<BS>\<Esc>"
  let &undolevels = old_undolevels
  unlet old_undolevels
endfunction
