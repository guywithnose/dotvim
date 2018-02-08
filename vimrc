let g:vimdir=expand('<sfile>:h') . '/'

execute 'set packpath+=' . vimdir

" Save original rtp at the end
" This allows custom ftplugins to load first
let oldrtp=&rtp
set rtp=
packloadall
execute 'set rtp+=' . oldrtp

execute 'source ' . vimdir . 'commands'
execute 'source ' . vimdir . 'settings'
execute 'source ' . vimdir . 'variables'
execute 'source ' . vimdir . 'tabs'
if has("autocmd")
  execute 'source ' . vimdir . 'fileTypes'
endif

let &rtp = $HOME . '/.vim,' . &rtp . ',' . vimdir

" execute 'source ' . vimdir . 'obsess'
