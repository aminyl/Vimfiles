" =============================================================================
" ref
" =============================================================================
let g:ref_refe_encoding = "UTF-8"
" + でカーソル下の単語のリファレンスを開く
nmap <silent> <unique> + <Plug>(ref-keyword)
vmap <silent> <unique> + <Plug>(ref-keyword)

" web検索
let g:ref_source_webdict_sites = {
\   'google':       { 'url': 'http://google.co.jp/search?q=%s' },
\   'wikipedia_ja': { 'url': 'http://ja.wikipedia.org/wiki/%s' },
\ }

" 出力に対するフィルタ。最初の数行を削除している。
function! g:ref_source_webdict_sites.wikipedia_ja.filter(output)
  return join(split(a:output, "\n")[18 :], "\n")
endfunction
