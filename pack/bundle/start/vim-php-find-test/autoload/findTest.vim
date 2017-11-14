function! findTest#findTest()
  let l:testPath = 'tests/' . expand('%')
  let l:testPath = substitute(l:testPath, '.php', 'Test.php', '')
  if filereadable(l:testPath)
    return l:testPath
  end
endfunction

function! findTest#findTested()
  let l:testedPath = substitute(expand('%'), 'tests/', '', '')
  let l:testedPath = substitute(l:testedPath, 'Test.php', '.php', '')
  if filereadable(l:testedPath)
    return l:testedPath
  end
endfunction

function! findTest#splitOther()
  let l:testPath = findTest#findTest()
  if l:testPath !=# '0'
    execute 'sp ' . l:testPath
    return
  end
  let l:testedPath = findTest#findTested()
  if l:testedPath !=# '0'
    execute 'sp ' . l:testedPath
    return
  end

  echo 'Unable to find file'
endfunction
