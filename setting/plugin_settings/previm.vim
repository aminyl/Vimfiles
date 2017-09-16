augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

let g:previm_open_cmd = ''
nnoremap [previm] <Nop>
nnoremap <silent> <F7> :<C-u>PrevimOpen<CR>
nnoremap <silent> <F5> :call previm#refresh()<CR>
