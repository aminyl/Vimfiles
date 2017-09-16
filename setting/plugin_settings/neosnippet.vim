let s:my_snippet = '~/vimfiles/snippet/'
let g:neosnippet#snippets_directory = s:my_snippet
" Tabでスニペットを展開する
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" <C-k>でスニペットを展開する
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)

"let g:neosnippet#enable_snipmate_compatibility = 1
"if has('win32')
"  let g:neosnippet#snippets_directory='C:/vim/snippets/'
"else
"  let g:neosnippet#snippets_directory='~/vimfiles/snippets/'
"endif
"" <C-Space>でスニペットを展開する
"imap <expr><C-Space> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<C-Space>"
"imap <expr><Space>   neosnippet#jumpable()   ? "\<Plug>(neosnippet_expand_or_jump)" : "\<Space>"
