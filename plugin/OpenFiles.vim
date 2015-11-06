
function! s:OpenAnswers()
  execute ":e $HOME/Google ドライブ/プログラミングコンテスト/ruby/vimcodes/A.rb"
  execute ":tabnew $HOME/Google ドライブ/プログラミングコンテスト/ruby/vimcodes/B.rb"
  execute ":tabnew $HOME/Google ドライブ/プログラミングコンテスト/ruby/vimcodes/C.rb"
  execute ":tabnew $HOME/Google ドライブ/プログラミングコンテスト/ruby/vimcodes/D.rb"
  execute ":tabnew $HOME/Google ドライブ/プログラミングコンテスト/ruby/vimcodes/E.rb"
  execute ":tabnew $HOME/Google ドライブ/プログラミングコンテスト/ruby/vimcodes/F.rb"
  execute ":tabnew $HOME/Google ドライブ/プログラミングコンテスト/ruby/vimcodes/test.rb"
  execute ":tabnew $HOME/Google ドライブ/プログラミングコンテスト/ruby/vimcodes/tmp_1.rb"
  execute ":tabnew $HOME/Google ドライブ/プログラミングコンテスト/ruby/vimcodes/tmp_2.rb"
endfunction

function! s:OpenReferences()
  execute ":e $HOME/Google ドライブ/プログラミングコンテスト/ruby/format.rb"
  execute ":tabnew $HOME/Google ドライブ/プログラミングコンテスト/ruby/ruby.rb"
  execute ":tabnew $HOME/Google ドライブ/プログラミングコンテスト/ruby/ruby_p.rb"
endfunction

function! s:OpenSettings()
  execute ":e $HOME/_vimrc"
  execute ":tabnew $HOME/_gvimrc"
  execute ":tabnew $HOME/vimfiles/snippet/ruby.snip"
endfunction

command! Oans call <SID>OpenAnswers()
command! Oref call <SID>OpenReferences()
command! Orcs call <SID>OpenSettings()



