" Vim起動時に「バッファ名が空」かつ「の場合はfiletype=ruby
autocmd VimEnter * nested if @% == '' && s:GetBufByte() == 0 | set filetype=ruby | endif
function! s:GetBufByte()
    let byte = line2byte(line('$') + 1)
    if byte == -1
        return 0
    else
        return byte - 1
    endif
endfunction
" バッファを開いたとき、「バッファ名にドットを含まない」かつ「Shebangがない」場合はfiletype=ruby
autocmd BufRead,BufNewFile * nested if @% !~ '\.' && getline(1) !~ '^#!.*' | set filetype=ruby | endif
