let vimdir=expand('<sfile>:h') . '/'
execute 'source ' . vimdir . 'bundle/vim-pathogen/autoload/pathogen.vim'
execute pathogen#infect('bundle/{}', vimdir . 'bundle/{}')
execute pathogen#helptags()

execute 'source ' . vimdir . 'bindings'
execute 'source ' . vimdir . 'commands'
execute 'source ' . vimdir . 'fileTypes'
execute 'source ' . vimdir . 'settings'
execute 'source ' . vimdir . 'variables'
execute 'source ' . vimdir . 'functions'
