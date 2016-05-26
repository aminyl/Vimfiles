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
set smarttab            " 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
" タブの画面上での幅(Rubyは2)(必要ないかもしれない)
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab           " タブをスペースに展開 (expandtab:展開する,noexpandtab:展開しない)
set autoindent					" 自動的にインデントする (noautoindent:インデントしない)
set smartindent					" 自動インデントを有効化する
set backspace=indent,eol,start	" バックスペースでインデントや改行を削除できるようにする
set showmatch			  		" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set wildmenu			  		" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmode=list,longest:full	" (よくわからん削除してもいいかも)
set formatoptions+=mM		" テキスト挿入中の自動折り返しを日本語に対応させる
set history=1000				" ヒストリの最大
" set shellslash				" Windowsで/(quickrunの時にエラーが出るので無効にしておく)
set tags=~/.tags				" タグファイルの指定(でもタグジャンプは使ったことがない)
" ステータス行に表示させる情報の指定
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=C:%c\ L:%l/%L 
augroup InsertHook
    autocmd InsertEnter * set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=C:%c\ L:%l/%L 
    autocmd InsertLeave * set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=C:%c\ L:%l/%L 
augroup END

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
set whichwrap=b,s,h,l,<,>,[,]	" カーソルを行頭，行末で止まらないようにする(mswin.vimを有効にしていてもhlの移動では必要)
syntax on				    		" 色づけをオン
set hidden				  		" バッファを保存しなくても他のバッファを表示できるようにする(保存されていないファイルがあるときでも別のファイルを開けるようにする)
set visualbell	    		" ビープの代わりにビジュアルベル(画面フラッシュ)を使う
" ビジュアルベルを無効化する(よくわからない)
set t_vb=
set shortmess=a

" =============================================================================
" Vim起動時に「バッファ名が空」かつ「の場合はfiletype=ruby
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
source ~/vimfiles/setting/my_mswin.vim	" C-C,C-V,カーソル移動など通常のエディタの挙動
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
set hlsearch			  		" 検索文字列をハイライト(する:hlsearch，しない:nohlsearc)
nnoremap <ESC><ESC> :nohlsearch<CR> " <ESC>連打でハイライトを消す
" いっぱい移動する
nnoremap J 5j
nnoremap K 5k
vnoremap J 5j
vnoremap K 5k
" nnoremap t <C-t>		" タグ関係
nnoremap se ggVG=<C-o><C-o><C-o><C-o>   " フォーマット
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
" ウィンドウの回転, よくわからない
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
" 置換を便利にする設定
" =============================================================================
" https://github.com/yuroyoro/dotfiles/blob/master/.vimrc.search
"選択した文字列を検索
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"選択した文字列を置換
vnoremap bb y:%s/<C-R>=escape(@", '\\/.*$^~[]')<CR>//gc<Left><Left><Left>
"s*でカーソル下のキーワードを置換
nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>//gc<Left><Left><Left>'

" カーソル位置の単語をヤンクした単語に置換
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/tips#TOC--8
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> cy   ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy   c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

" プラグイン設定
source ~/vimfiles/setting/plugin.vim

" よくわかんないやつ(わかったら順次コメントアウトしている)
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
 



