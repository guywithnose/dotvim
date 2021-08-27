let g:vimdir=expand('<sfile>:h') . '/'

execute 'set packpath+=' . vimdir

" Save original rtp at the end
" This allows custom ftplugins to load first
let oldrtp=&rtp
set rtp=
packloadall
execute 'set rtp+=' . oldrtp

if has("autocmd")
  autocmd FileType typescript setlocal redrawtime=50
  autocmd FileType typescript syntax off
  autocmd FileType typescriptreact setlocal redrawtime=50
  autocmd FileType typescriptreact syntax off
endif

let secretFile = vimdir . 'secrets'
if filereadable(secretFile)
  execute 'source ' . vimdir . 'secrets'
endif
execute 'source ' . vimdir . 'commands'
execute 'source ' . vimdir . 'settings'
execute 'source ' . vimdir . 'variables'
execute 'source ' . vimdir . 'tabs'
if has("autocmd")
  execute 'source ' . vimdir . 'fileTypes'
endif

let &rtp = $HOME . '/.vim,' . &rtp . ',' . vimdir

" execute 'source ' . vimdir . 'obsess'
