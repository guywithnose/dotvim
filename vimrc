let vimdir=expand('<sfile>:h') . '/'
execute 'source ' . vimdir . 'bundle/vim-pathogen/autoload/pathogen.vim'

" Prevent warning when running vim without python
if !has("python")
  let g:pathogen_disabled = ['ultisnips']
endif

execute pathogen#infect('bundle/{}', vimdir . 'bundle/{}')
Helptags

execute 'source ' . vimdir . 'bindings'
execute 'source ' . vimdir . 'commands'
execute 'source ' . vimdir . 'settings'
execute 'source ' . vimdir . 'variables'
execute 'source ' . vimdir . 'functions'
if has("autocmd")
  execute 'source ' . vimdir . 'fileTypes'
endif
