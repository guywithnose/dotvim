" Break a PHP array onto multiple lines
function! phpArraySplitJoin#splitArray()
  let oldSearch = @/

  s/\v\[(.)/\[\r\1/
  s/\v\=\> (\[.*\]|[^,]+), /=> \1,\r/g
  s/\v(.)\](,|;)$/\1,\r\]\2/
  normal =a]

  let @/ = oldSearch
endfunction

" Join a PHP array onto one line
function! phpArraySplitJoin#joinArray()
  let oldSearch = @/

  execute "normal va[\<esc>"
  '<,'>join
  s/\v\[ /[/g
  s/\v, \]/]/g

  let @/ = oldSearch
endfunction
