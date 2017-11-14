function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    echom "test"
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    echom "build"
    call go#cmd#Build(0)
  endif
endfunction

noremap <LocalLeader>a :update<return>:<C-u>call go#alternate#Switch(0, 'tabe')<return>
inoremap <LocalLeader>a <esc>:update<return>:call go#alternate#Switch(0, 'tabe')<return>
noremap <LocalLeader>b :update<return>:<C-u>call <SID>build_go_files()<return>
inoremap <LocalLeader>b <esc>:update<return>:call <SID>build_go_files()<return>
noremap <LocalLeader>r :update<return>:GoRun<return>
inoremap <LocalLeader>r <esc>:update<return>:GoRun<return>
