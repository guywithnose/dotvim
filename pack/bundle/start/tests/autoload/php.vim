function! php#OpenTestFile()
  let l:fileName = expand('%')
  if (strpart(l:fileName, 0, 5) == 'tests')
    let l:fileName = substitute(substitute(l:fileName, 'tests/', '', ''), 'Test.php', '.php', '')
  else
    let l:fileName = 'tests/' . substitute(substitute(l:fileName, 'src/', '', ''), '.php', 'Test.php', '')
  endif

  if !empty(findfile(l:fileName))
    execute 'tabnew ' . findfile(l:fileName)
    return
  endif

  echo l:fileName . ' doesnt exist'
endfunction
