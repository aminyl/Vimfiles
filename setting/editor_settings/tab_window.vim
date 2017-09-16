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
" nnoremap sn gt    " 次のタブに切り替え
" nnoremap sp gT    " 前のタブに切り替え
" nnoremap sT :<C-u>Unite tab<CR>   " タブ一覧
nnoremap sq :<C-u>q<CR>             " ウィンドウを閉じる
" nnoremap sQ :<C-u>bd<CR>          " バッファを閉じる
" nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR> " 現在のタブのバッファ一覧
" nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>     " バッファ一覧
" nnoremap sN :<C-u>bn<CR>
" nnoremap sP :<C-u>bp<CR>

" call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
" call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
" call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
" call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
" call submode#map('bufmove', 'n', '', '>', '<C-w>>')
" call submode#map('bufmove', 'n', '', '<', '<C-w><')
" call submode#map('bufmove', 'n', '', '+', '<C-w>+')
" call submode#map('bufmove', 'n', '', '-', '<C-w>-')
