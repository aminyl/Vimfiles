" ステータス行に表示させる情報
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=C:%c\ L:%l/%L 
augroup InsertHook
    autocmd InsertEnter * set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=C:%c\ L:%l/%L 
    autocmd InsertLeave * set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=C:%c\ L:%l/%L 
augroup END

" ステータス行に現在のgitブランチを表示する(未知関数です，無効な式ですというエラー)
" set statusline+=%{fugitive#statusline()}

" set listchars=tab:>-,extends:<,trail:-,eol:<	" どの文字でタブや改行を表示するかを設定
" set listchars=tab:>\ ,extends:<		  	      	" タブと行の続きを可視化する(上の設定とどちらが良いか)
" set listchars=tab:^\_,trail:~,extends:. 	  	"タブ部分に~を表示
