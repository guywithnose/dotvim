noremap <Leader>gr :<c-u>Git rebase upstream/master<return>
inoremap <Leader>gr <esc>:Git rebase upstream/master<return>
noremap <Leader>gi :<c-u>Git rebase --interactive upstream/master<return>
inoremap <Leader>gi <esc>:Git rebase --interactive upstream/master<return>
noremap <Leader>gp :<c-u>call PushCurrentBranch()<return>
inoremap <Leader>gp <esc>:call PushCurrentBranch()<return>
noremap <Leader>gpf :<c-u>call PushCurrentBranch(1)<return>
inoremap <Leader>gpf <esc>:call PushCurrentBranch(1)<return>
noremap <Leader>gs :<c-u>Gstatus<return>
inoremap <Leader>gs <esc>:Gstatus<return>

" Push to the currently checked out branch
" If no branch is checked out this does nothing and echos a warning
function! PushCurrentBranch(...)
  let l:currentBranchName=fugitive#head()
  let l:force = ''
  if a:0 >= 1 && a:1
    let l:force = '--force'
  endif
  if l:currentBranchName != ''
    execute 'Gpush ' . l:force . ' origin ' . l:currentBranchName
  else
    echo 'Not currently on a branch!'
  endif
endfunction
