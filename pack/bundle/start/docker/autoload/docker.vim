" Build and run the docker file in the current directory
function! docker#build(...)
  let l:imageName=expand('%:p:h:t')
  let l:entrypoint = ''
  let l:command = ''
  if a:0
    let l:entrypoint = '--entrypoint=env'
    let l:command = a:1
  endif
  execute '!docker build -t ' . l:imageName . ' . && docker run -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix ' . l:entrypoint . '  -it ' . l:imageName . ' ' . l:command
endfunction
