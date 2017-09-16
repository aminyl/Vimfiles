let showmarks_enable = 1
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" let showmarks_hlline_lower = 1
" let showmarks_hlline_upper = 1
autocmd ColorScheme * highlight ShowMarksHLl ctermfg=darkblue ctermbg=blue cterm=bold guifg=#C8FE2E guibg=#1b1d1e gui=bold
autocmd ColorScheme * highlight ShowMarksHLu ctermfg=darkblue ctermbg=blue cterm=bold guifg=#C8FE2E guibg=#1b1d1e gui=bold
autocmd ColorScheme * highlight ShowMarksHLo ctermfg=darkblue ctermbg=blue cterm=bold guifg=#C8FE2E guibg=#1b1d1e gui=bold
autocmd ColorScheme * highlight ShowMarksHLm ctermfg=darkblue ctermbg=blue cterm=bold guifg=#C8FE2E guibg=#1b1d1e gui=bold

nnoremap <silent> mH :ShowMarksClearMark <CR>
nnoremap <silent> mD :ShowMarksClearAll <CR>
nnoremap <silent> mT :ShowMarksToggle <CR>
" マークの背景は次のようにSignColumnでcolor.vimに設定
" autocmd ColorScheme * highlight SignColumn ctermfg=22 guifg=#325c32 guibg=#1b1d1e
