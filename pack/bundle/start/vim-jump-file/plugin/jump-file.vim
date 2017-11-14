function! JumpFileForward()
  call s:jumpUntilBufferChange("normal! 1\<c-i>")
endfunction

function! JumpFileBackward()
  call s:jumpUntilBufferChange("normal! 1\<c-o>")
endfunction

function! s:jumpUntilBufferChange(command)
  let l:currentBuffer = expand('%')
  while expand('%') == l:currentBuffer
    let l:currentPos = [line('.'), col(',')]
    execute a:command
    if l:currentPos == [line('.'), col(',')]
      echom 'No more jumps'
      return
    endif
  endwhile
endfunction
