call watchdogs#setup(g:quickrun_config)
let g:watchdogs_check_BufWritePost_enable = 1
let g:qfsigns#Config = {'id': '5050', 'name': 'QFError',}
execute 'sign define '.get(g:qfsigns#Config,'name').' texthl=Error text=>>'
