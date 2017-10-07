function! s:OpenAnswers()
  execute ":silent e $HOME/GoogleDrive/ProgrammingContest/ruby/palette/A.rb"
  execute ":silent tabnew $HOME/GoogleDrive/ProgrammingContest/ruby/palette/B.rb"
  execute ":silent tabnew $HOME/GoogleDrive/ProgrammingContest/ruby/palette/C.rb"
  execute ":silent tabnew $HOME/GoogleDrive/ProgrammingContest/ruby/palette/D.rb"
  execute ":silent tabnew $HOME/GoogleDrive/ProgrammingContest/ruby/palette/E.rb"
  execute ":silent tabnew $HOME/GoogleDrive/ProgrammingContest/ruby/palette/F.rb"
  execute ":silent tabnew $HOME/GoogleDrive/ProgrammingContest/ruby/palette/tmp_0.rb"
  execute ":silent tabnew $HOME/GoogleDrive/ProgrammingContest/ruby/palette/tmp_1.rb"
  execute ":silent tabnew $HOME/GoogleDrive/ProgrammingContest/ruby/palette/tmp_2.rb"
endfunction

function! s:OpenReferences()
  execute ":silent e $HOME/GoogleDrive/ProgrammingContest/ruby/format.rb"
  execute ":silent tabnew $HOME/GoogleDrive/ProgrammingContest/ruby/ruby.rb"
  execute ":silent tabnew $HOME/GoogleDrive/ProgrammingContest/ruby/ruby_p.rb"
  execute ":silent tabnew $HOME/GoogleDrive/ProgrammingContest/vim/vimmemo.rb"
endfunction

function! s:OpenSettings()
  execute ":silent e $HOME/vimfiles/_vimrc"
  execute ":silent tabnew $HOME/vimfiles/_gvimrc"
  execute ":silent tabnew $HOME/vimfiles/snippet/ruby.snip"
endfunction

function! s:OpenSubSettings()
  execute ":silent e $HOME/vimfiles/setting/color.vim"
  execute ":silent tabnew $HOME/vimfiles/setting/plugin.vim"
  execute ":silent tabnew $HOME/vimfiles/setting/editor_settings/my_mswin.vim"
endfunction

command! Oans call <SID>OpenAnswers()
command! Oref call <SID>OpenReferences()
command! Orcs call <SID>OpenSettings()
command! Oset call <SID>OpenSubSettings()

