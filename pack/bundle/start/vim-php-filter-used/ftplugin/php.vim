function! FilterUsed()
  let l:useLineMatcher = '^use \(\S*\\\)\?\(\S*\);'
  " Move to the first use line
  silent execute 'normal! gg/'. l:useLineMatcher . ''
  while search(l:useLineMatcher, 'c', line('.')) != 0
    let l:matches = matchlist(getline(line('.')), l:useLineMatcher)
    normal! $
    if (search(l:matches[2], 'nW') == 0)
      normal! dd
    else
      silent normal! j0
    endif
  endwhile
endfunction
