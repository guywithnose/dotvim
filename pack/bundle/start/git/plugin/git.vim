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
