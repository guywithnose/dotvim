let vimdir=expand('<sfile>:h') . '/'
execute 'source ' . vimdir . 'bundle/vim-pathogen/autoload/pathogen.vim'
execute pathogen#infect('bundle/{}', vimdir . 'bundle/{}')
Helptags

execute 'source ' . vimdir . 'bindings'
execute 'source ' . vimdir . 'commands'
if has("autocmd")
  execute 'source ' . vimdir . 'fileTypes'
endif
execute 'source ' . vimdir . 'settings'
execute 'source ' . vimdir . 'variables'
execute 'source ' . vimdir . 'functions'
