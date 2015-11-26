set number              " 行番号を表示 (表示:number，非表示:nonumber)
set ruler               " ルーラーを表示 (noruler:非表示)
set nolist		      		" タブや改行を表示 (list:表示)
set nowrap				      " 長い行を折り返して表示 (wrap:折り返す，nowrap:折り返さない)
set laststatus=2	    	" 常にステータス行を表示 (詳細は:he laststatus)
set cmdheight=2		    	" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set showcmd			      	" コマンドをステータス行に表示
set title               " タイトルを表示
set incsearch           " インクリメントサーチ(検索ワードの最初の文字を入力した時点で検索を開始する)
set autochdir           " 開いたファイルのディレクトリに移動
set clipboard=unnamed   " クリップボード共有
set ignorecase          " 検索時に大文字小文字を無視 (noignorecase:無視しない)
set smartcase           " 大文字小文字の両方が含まれている場合は大文字小文字を区別
set wrapscan            " 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set smarttab            "行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
" タブの画面上での幅(Rubyは2)(必要ないかもしれない)
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab           " タブをスペースに展開 (expandtab:展開する,noexpandtab:展開しない)
set autoindent					" 自動的にインデントする (noautoindent:インデントしない)
set smartindent					"自動インデントを有効化する
set backspace=indent,eol,start	" バックスペースでインデントや改行を削除できるようにする
set showmatch			  		" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set wildmenu			  		" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmode=list,longest:full	"(よくわからん削除してもいいかも)
set formatoptions+=mM		" テキスト挿入中の自動折り返しを日本語に対応させる
set history=1000				" ヒストリの最大
" set shellslash				" Windowsで/(quickrunの時にエラーが出るので無効にしておく)
set tags=~/.tags				" タグファイルの指定(でもタグジャンプは使ったことがない)
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ステータス行に現在のgitブランチを表示する(未知関数です，無効な式ですというエラー)
" set statusline+=%{fugitive#statusline()}
set noswapfile					" スワップ無し(ときどき面倒な警告が出るだけで役に立ったことがない)
"set noundofile					" undoファイル無し
set backupdir=$HOME/.vimbackup	" バックアップディレクトリの指定
set undodir=$HOME/.vimbackup	  " アンドゥディレクトリの指定
"set nobackup					  " バックアップファイルを作成しない
set browsedir=buffer		" バッファで開いているファイルのディレクトリでエクスクローラを開始する
"set listchars=tab:>-,extends:<,trail:-,eol:<	" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>\ ,extends:<			      	" タブと行の続きを可視化する(上の設定とどちらが良いか)
"set listchars=tab:^\_,trail:~,extends:.	  	"タブ部分に~を表示
"set cursorline
"hi clear CursorLine
set whichwrap=b,s,h,l,<,>,[,]	" カーソルを行頭、行末で止まらないようにする(mswin.vimを有効にしていてもhlの移動では必要)
syntax on				    		" 色づけをオン
set hidden				  		" バッファを保存しなくても他のバッファを表示できるようにする(保存されていないファイルがあるときでも別のファイルを開けるようにする)
source ~/vimfiles/my_mswin.vim	" C-C,C-V,カーソル移動など通常のエディタの挙動
" =============================================================================
" Vim起動時に、「バッファ名が空」かつ「の場合はfiletype=ruby
" =============================================================================
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
" =============================================================================
" keymapping
" =============================================================================
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
" 保存 " mswin.vimとかぶるので使用しない
"nnoremap <C-s> :w<ENTER>
"inoremap <C-s> <ESC>:w<ENTER><ESC>a
inoremap jj <ESC>				" エスケープ
set hlsearch			  		" 検索文字列をハイライト(する:hlsearch，しない:nohlsearc)
" nnoremap <C-L> :nohl<CR><C-L>	    " <C-L>で検索後の強調表示を解除する
nnoremap <ESC><ESC> :nohlsearch<CR> " <ESC>連打でハイライトを消す
" いっぱい移動する
nnoremap J 5j
nnoremap K 5k
vnoremap J 5j
vnoremap K 5k
"nnoremap t <C-t>		" タグ関係
set visualbell			" ビープの代わりにビジュアルベル（画面フラッシュ）を使う
" ビジュアルベルを無効化する(よくわからない)
set t_vb=
set shortmess=a
nnoremap se ggVG=		" フォーマット
map Y y$		        " Yの動作をDやCと同じにする
" =============================================================================
" タブ，ウィンドウ
" =============================================================================
nnoremap s <Nop>
nnoremap ss :<C-u>sp<CR> " 水平分割
nnoremap sv :<C-u>vs<CR> " 垂直分割
" ウィンドウ間移動
nnoremap sj <C-w>j 
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sw <C-w>w
" ウィンドウの移動
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
" ウィンドウの回転
nnoremap sr <C-w>r
" ウィンドウ幅の調整
nnoremap so <C-w>_<C-w>| "ウィンドウの最大化 縦横
nnoremap <C-l> <C-w>>
nnoremap <C-h> <C-w><
nnoremap <C-j> <C-w>+
nnoremap <C-k> <C-w>-
nnoremap sO <C-w>=  " ウィンドウの大きさを揃える
" タブ
nnoremap st :<C-u>tabnew<CR> " 新規タブ
nnoremap } gt       " 次のタブに切り替え
nnoremap { gT       " 前のタブに切り替え
"nnoremap sn gt     " 次のタブに切り替え
"nnoremap sp gT     " 前のタブに切り替え
"nnoremap sT :<C-u>Unite tab<CR>  " タブ一覧
nnoremap sq :<C-u>q<CR>     " ウィンドウを閉じる
"nnoremap sQ :<C-u>bd<CR>   " バッファを閉じる
"nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR> " 現在のタブのバッファ一覧
"nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>     " バッファ一覧
"nnoremap sN :<C-u>bn<CR>
"nnoremap sP :<C-u>bp<CR>

"call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
"call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
"call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
"call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
"call submode#map('bufmove', 'n', '', '>', '<C-w>>')
"call submode#map('bufmove', 'n', '', '<', '<C-w><')
"call submode#map('bufmove', 'n', '', '+', '<C-w>+')
"call submode#map('bufmove', 'n', '', '-', '<C-w>-')
" =============================================================================
" 最後のカーソル位置を復元する
" =============================================================================
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
" =============================================================================
" showmarks
" =============================================================================
let showmarks_enable = 1
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" let showmarks_hlline_lower = 1
" let showmarks_hlline_upper = 1
autocmd ColorScheme * highlight ShowMarksHLl ctermfg=darkblue ctermbg=blue cterm=bold guifg=#C8FE2E guibg=#1b1d1e gui=bold
autocmd ColorScheme * highlight ShowMarksHLu ctermfg=darkblue ctermbg=blue cterm=bold guifg=#C8FE2E guibg=#1b1d1e gui=bold
autocmd ColorScheme * highlight ShowMarksHLo ctermfg=darkblue ctermbg=blue cterm=bold guifg=#C8FE2E guibg=#1b1d1e gui=bold
autocmd ColorScheme * highlight ShowMarksHLm ctermfg=darkblue ctermbg=blue cterm=bold guifg=#C8FE2E guibg=#1b1d1e gui=bold
" マークの背景は次のようにSignColumnで_gvimrcに設定
" autocmd ColorScheme * highlight SignColumn ctermfg=22 guifg=#325c32 guibg=#1b1d1e
"" =============================================================================
"" quickrun
"" =============================================================================
"" 出力場所(以下の設定でまとめてやっているのでここのはすべてコメントアウト)
"" let g:quickrun_config={'_': {'split': 'vertical'}} " 垂直分割
"" let g:quickrun_config={'_': {'split': ''}} " 水平分割上に表示
"" let g:quickrun_config={'_': {'split': 'below'}} " 水平分割下に表示(現在の設定)
"nnoremap <silent> <C-@> :QuickRun<CR> "<C-@>に割り当て(<C-q>だと矩形選択とかぶる)
"" <C-c>でQuickRunの強制終了
"nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
"
"" 実行中は shabadouのアニメーションを表示
"function s:iconv_list(l)
"  if has('win32')
"    return map(a:l,"iconv(v:val,'cp932','utf-8')")
"  endif
"  return a:l
"endfunction
"
"" エラーならquickfix, 成功ならバッファに表示
"let g:quickrun_config = {
"\  "_" : {
"\    "runner": "vimproc",
"\    "runner/vimproc/updatetime": 20,
"\    "hook/shobon_rotate/enable": 1,
"\    "hook/shobon_rotate/wait" : 1,
"\    "outputter": "multi:buffer:quickfix",
"\    "hook/quickfix_replate_tempname_to_bufnr/enable_exit": 1,
"\    "hook/quickfix_replate_tempname_to_bufnr/priority_exit": -10,
"\    "hook/close_quickfix/enable_success": 1,
"\    "hook/close_quickfix/enable_hook_loaded": 1,
"\    'split':'below'
"\  },
"\  'cpp/vc': {
"\    'command': 'cl.bat',
"\    'exec': ['%c %o %s /nologo /Fo%s:p:r.obj /Fe%s:p:r.exe',
"\            '%s:p:r.exe %a'],
"\    'tempfile': '%{tempname()}.cpp',
"\    'hook/sweep/files': ['%S:p:r.exe', '%S:p:r.obj'],
"\  },
"\  "msbuild" : {
"\    "command": "search_and_msbuild.bat",
"\    "exec": "%c %o %s:p:r",
"\    "cmdopt": "",
"\  },
"\  'watchdogs_checker/_' : {
"\    'outputter/quickfix/open_cmd' : '',
"\    'hook/qfsigns_update/enable_exit':   1,
"\    'hook/qfsigns_update/priority_exit': 3,
"\  },
"\  "ruby/watchdogs_checker" : {
"\    "type" : "watchdogs_checker/rubocop"
"\  },
"\  "cpp/watchdogs_checker" : {
"\    "type" : "watchdogs_checker/msvc"
"\  },
"\}
"
"" VC++をデフォルトにしておく
"if has('win32')
"  let g:quickrun_config.cpp = { "type": "cpp/vc" }
"endif
"
"" =============================================================================
"" neocomplete
"" =============================================================================
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#auto_completion_start_length = 1
"let g:neocomplete#sources#buffer#cache_limit_size = 500000
"let g:neocomplete#data_directory = $HOME.'/.vim/cache/neocompl'
"let g:neocomplete#min_keyword_length = 4
"let g:neocomplete#sources#syntax#min_keyword_length = 1
"let g:neocomplete#enable_smart_case = 1
"let g:neocomplete#enable_fuzzy_completion = 0
"let g:neocomplete#enable_refresh_always = 1
"
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"    \ 'ruby' : $HOME.'/vimfiles/dictionary/ruby.dict'
"    \ }
"
"augroup omnicomplete
"  autocmd!
"  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"  autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
"  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
"  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"augroup END
"
"if !exists('g:neocomplete#keyword_patterns')
"    let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"
"call neocomplete#custom#source('_', 'converters',
"  \ ['converter_remove_overlap', 'converter_remove_last_paren',
"  \  'converter_delimiter', 'converter_abbr'])
"  



"let g:acp_enableAtStartup = 0
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#enable_smart_case = 1
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"
"if !exists('g:neocomplete#keyword_patterns')
"  let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType ruby set omnifunc=rubycomplete#Complete
"
"" ドットやアローで補完リストを表示する
"if !exists('g:neocomplete#force_omni_input_patterns')
"  let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"" let g:neocomplete#force_omni_input_patterns.cpp  = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
"" let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"" let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
"
"" <C-Space>でオムニ補完 VisualStudioに合わせる
"imap <Nul> <C-x><C-o>
"imap <C-Space> <C-X><C-O>
"
" =============================================================================
" neosnippet
" =============================================================================
let s:my_snippet = '~/vimfiles/snippet/'
let g:neosnippet#snippets_directory = s:my_snippet
"" Tabでスニペットを展開する
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
"" =============================================================================
"" watchdogs 導入方法がわからないのでとりあえずコメントアウト
"" =============================================================================
""call watchdogs#setup(g:quickrun_config)
"
""let g:watchdogs_check_BufWritePost_enable = 1
"
""let g:qfsigns#Config = {'id': '5050', 'name': 'QFError',}
""execute 'sign define '.get(g:qfsigns#Config,'name').' texthl=Error text=>>'
"
"" =============================================================================
"" ref
"" =============================================================================
"let g:ref_refe_encoding = "UTF-8"
"" + でカーソル下の単語のリファレンスを開く
"nmap <silent> <unique> + <Plug>(ref-keyword)
"vmap <silent> <unique> + <Plug>(ref-keyword)
"
"" web検索
"let g:ref_source_webdict_sites = {
"\   'google':       { 'url': 'http://google.co.jp/search?q=%s' },
"\   'wikipedia_ja': { 'url': 'http://ja.wikipedia.org/wiki/%s' },
"\ }
"
"" 出力に対するフィルタ。最初の数行を削除している。
"function! g:ref_source_webdict_sites.wikipedia_ja.filter(output)
"  return join(split(a:output, "\n")[18 :], "\n")
"endfunction
"
"" =============================================================================
"" unite
"" =============================================================================
"let g:unite_enable_start_insert = 1        " 最初からinsertモードにしておく
"let g:unite_source_history_yank_enable = 1 " ヤンク履歴とか使えるようにする
"let g:unite_source_history_yank_limit = 100 " 履歴の最大を設定
"
"" , にショートカットを割り振っておく
"" Everythingを起動している必要あり、加えて別途es.exeをDLしてパスを通す
"nnoremap <silent> ,a  :<C-u>Unite everything/async -buffer-name=everything<CR>
"" 最近開いたファイルとかその他諸々(かなり高速)
"nnoremap <silent> ,f :<C-u>Unite buffer file_mru file -buffer-name=searcher<CR>
"" ヤンク(コピー履歴)
"nnoremap <silent> ,z :<C-u>Unite history/yank -buffer-name=history/yank<CR>
"" grep結果, :Unite grep:(パス)
"nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
"
"" <C-l>でウィンドウ分割して開く, <C-o>でタブで開く
""au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
""au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"au FileType unite nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('tabopen')
"au FileType unite inoremap <silent> <buffer> <expr> <C-o> unite#do_action('tabopen')
"au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
"au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
"
"" grepはthe platium searcherを使う（速い！） (必須) pt.exe
"if executable('pt')
"  let g:unite_source_grep_command = 'pt'
"  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
"  let g:unite_source_grep_recursive_opt = ''
"  let g:unite_source_grep_encoding = 'utf-8'
"endif
"
"set grepprg=pt\ --nogroup
"
"" =============================================================================
"" syntasitc
"" =============================================================================
"" 保存の度にrubyのコーディングスタイルが正しいかチェックする
"" let g:syntastic_ruby_checkers = ['rubocop']
"
"
"" =============================================================================
"" codic
"" =============================================================================
"inoremap <silent> <C-o>  <C-R>=<SID>codic_complete()<CR>
"function! s:codic_complete()
"  let line = getline('.')
"  let start = match(line, '\k\+$')
"  let cand = s:codic_candidates(line[start :])
"  call complete(start +1, cand)
"  return ''
"endfunction
"function! s:codic_candidates(arglead)
"  let cand = codic#search(a:arglead, 30)
"  " error
"  if type(cand) == type(0)
"    return []
"  endif
"  " english -> english terms
"  if a:arglead =~# '^\w\+$'
"    return map(cand, '{"word": v:val["label"], "menu": join(map(copy(v:val["values"]), "v:val.word"), ",")}')
"  endif
"  " japanese -> english terms
"  return s:reverse_candidates(cand)
"endfunction
"function! s:reverse_candidates(cand)
"  let _ = []
"  for c in a:cand
"    for v in c.values
"      call add(_, {"word": v.word, "menu": !empty(v.desc) ? v.desc : c.label })
"    endfor
"  endfor
"  return _
"endfunction
"
"" =============================================================================
"" previm
"" =============================================================================
"augroup PrevimSettings
"    autocmd!
"    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
"augroup END
"
"" Previm
"let g:previm_open_cmd = ''
"nnoremap [previm] <Nop>
"nnoremap <silent> <F7> :<C-u>PrevimOpen<CR>
"nnoremap <silent> <F5> :call previm#refresh()<CR>
"
"" =============================================================================
"" paste mode
"" =============================================================================
"" 貼り付け時に無駄にインデントするのを防ぐ
"if &term =~ "xterm"
"  let &t_ti .= "\e[?2004h"
"  let &t_te .= "\e[?2004l"
"  let &pastetoggle = "\e[201~"
"
"  function XTermPasteBegin(ret)
"    set paste
"    return a:ret
"  endfunction
"
"  noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
"  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
"  cnoremap <special> <Esc>[200~ <nop>
"  cnoremap <special> <Esc>[201~ <nop>
"endif






"---------------よくわかんないやつ(わかったら順次コメントアウトしている)
" filetype on
" filetype plugin on
" filetype indent on
" 強く推奨するオプション
" 歴史的にモードラインはセキュリティ上の脆弱性になっていたので、
" オフにして代わりに上記のsecuremodelinesスクリプトを使うとよい。
" set nomodeline
" 移動コマンドを使ったとき、行頭に移動しない
" set nostartofline
" バッファが変更されているとき、コマンドをエラーにするのでなく、保存する
" かどうか確認を求める
" set confirm
 
" キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
" set notimeout ttimeout ttimeoutlen=200
 
" <F11>キーで'paste'と'nopaste'を切り替える
" set pastetoggle=<F11>
 


" ------------------------------プラグイン一覧
" NeoBundle 'chriskempson/tomorrow-theme' " カラースキーム
" NeoBundle 'w0ng/vim-hybrid'         " カラースキーム
" NeoBundle 'Shougo/unite.vim'        " 検索インタフェース
" NeoBundle 'Shougo/neomru.vim'       " 履歴
" NeoBundle 'Shougo/neocomplete.vim'  " 補完
" NeoBundle 'Shougo/neosnippet.vim'   " スニペット補完
" NeoBundle 'Shougo/neosnippet-snippets' " スニペット集
" NeoBundle 'itchyny/lightline.vim'   " 綺麗なステータスライン
" NeoBundle 'thinca/vim-quickrun'     " バッファのコードを実行
" NeoBundle 'osyo-manga/shabadou.vim' " QuickRunの拡張
" NeoBundle 'thinca/vim-ref'          " クイックリファレンス閲覧
" NeoBundle 'Shougo/unite-outline'    " コード中のクラスの概要
" NeoBundle 'sgur/unite-everything'   " デスクトップ検索
" NeoBundle 'osyo-manga/vim-watchdogs' " 静的コード解析(非同期)
" NeoBundle 'dannyob/quickfixstatus'  " quickfixをコマンドウィンドウに表示
" NeoBundle 'KazuakiM/vim-qfsigns'    " quickfixをsign領域に表示
" NeoBundle 'koron/codic-vim'         " 英和辞書(補完にも使う)
" NeoBundle 'rhysd/unite-codic.vim'   " uniteで英和辞書を使う
" NeoBundle 'tpope/vim-rails'         " rails
" NeoBundle 'kannokanno/previm'       " プレビュー
" NeoBundle 'tyru/open-browser.vim'   " ブラウザオープン
" NeoBundle 'scrooloose/syntastic'    " 静的コード解析
" NeoBundle 'ekalinin/Dockerfile.vim' " docker
" NeoBundle 'tpope/vim-endwise'       " Ruby向けにendを自動挿入してくれる
" NeoBundle 'tomtom/tcomment_vim'     " コメントON/OFFを手軽に実行
