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
set tabstop=2           " タブ幅
set shiftwidth=2        " タブ幅
set softtabstop=2       " タブ幅
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
syntax on				    		" 色づけをオン
set hidden				  		" バッファを保存しなくても他のバッファを表示できるようにする(保存されていないファイルがあるときでも別のファイルを開けるようにする)
set visualbell	    		" ビープの代わりにビジュアルベル(画面フラッシュ)を使う
set t_vb=               " ビジュアルベルを無効化する(よくわからない)
set noswapfile					" スワップ無し(ときどき面倒な警告が出るだけで役に立ったことがない)
" set nobackup					  " バックアップファイルを作成しない
" set noundofile					" undoファイル無し
set backupdir=$HOME/.vimbackup	" バックアップディレクトリの指定
set undodir=$HOME/.vimbackup	  " undoディレクトリの指定
set browsedir=buffer		" バッファで開いているファイルのディレクトリでエクスクローラを開始する
set cursorline          " 今いる行に線を引く
hi clear CursorLine
set hlsearch			  		" 検索文字列をハイライト(する:hlsearch，しない:nohlsearc)
set shortmess=a
set dictionary=$HOMEPATH/vimfiles/dictionary/ruby.dict
set whichwrap=b,s,h,l,<,>,[,]	" カーソルを行頭，行末で止まらないようにする(mswin.vimを有効にしていてもhlの移動では必要)

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
" バッファが変更されているとき、コマンドをエラーにするのでなく、保存するかどうか確認を求める
" set confirm
" キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
" set notimeout ttimeout ttimeoutlen=200
" <F11>キーで'paste'と'nopaste'を切り替える
" set pastetoggle=<F11>
