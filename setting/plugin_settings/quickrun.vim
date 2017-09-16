" 出力場所(以下の設定でまとめてやっているのでここのはすべてコメントアウト)
" let g:quickrun_config={'_': {'split': 'vertical'}} " 垂直分割
" let g:quickrun_config={'_': {'split': ''}} " 水平分割上に表示
" let g:quickrun_config={'_': {'split': 'below'}} " 水平分割下に表示(現在の設定)

nnoremap <silent> <C-@> :QuickRun<CR> "<C-@>に割り当て(<C-q>だと矩形選択とかぶる)
 <C-c>でQuickRunの強制終了
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" 実行中は shabadouのアニメーションを表示
function s:iconv_list(l)
  if has('win32')
    return map(a:l,"iconv(v:val,'cp932','utf-8')")
  endif
  return a:l
endfunction

" エラーならquickfix, 成功ならバッファに表示
let g:quickrun_config = {
\  "_" : {
\    "runner": "vimproc",
\    "runner/vimproc/updatetime": 20,
\    "hook/shobon_rotate/enable": 1,
\    "hook/shobon_rotate/wait" : 1,
\    "outputter": "multi:buffer:quickfix",
\    "hook/quickfix_replate_tempname_to_bufnr/enable_exit": 1,
\    "hook/quickfix_replate_tempname_to_bufnr/priority_exit": -10,
\    "hook/close_quickfix/enable_success": 1,
\    "hook/close_quickfix/enable_hook_loaded": 1,
\    'split':'below'
\  },
\  'cpp/vc': {
\    'command': 'cl.bat',
\    'exec': ['%c %o %s /nologo /Fo%s:p:r.obj /Fe%s:p:r.exe',
\            '%s:p:r.exe %a'],
\    'tempfile': '%{tempname()}.cpp',
\    'hook/sweep/files': ['%S:p:r.exe', '%S:p:r.obj'],
\  },
\  "msbuild" : {
\    "command": "search_and_msbuild.bat",
\    "exec": "%c %o %s:p:r",
\    "cmdopt": "",
\  },
\  'watchdogs_checker/_' : {
\    'outputter/quickfix/open_cmd' : '',
\    'hook/qfsigns_update/enable_exit':   1,
\    'hook/qfsigns_update/priority_exit': 3,
\  },
\  "ruby/watchdogs_checker" : {
\    "type" : "watchdogs_checker/rubocop"
\  },
\  "cpp/watchdogs_checker" : {
\    "type" : "watchdogs_checker/msvc"
\  },
\}

" VC++をデフォルトにしておく
if has('win32')
  let g:quickrun_config.cpp = { "type": "cpp/vc" }
endif
