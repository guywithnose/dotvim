" Fallback to normal execution if vim-dispatch is not installed
silent! command -nargs=* Dispatch execute "!" . <q-args>

command! PhpCs Dispatch php -l % && phpcs -n %
command! PhpCsNoWarnings Dispatch php -l % && phpcs %

noremap <LocalLeader>cs :update<return>:PhpCs<return>
inoremap <LocalLeader>cs <esc>:update<return>:PhpCs<return>
noremap <LocalLeader>ns :update<return>:PhpCsNoWarnings<return>
inoremap <LocalLeader>ns <esc>:update<return>:PhpCsNoWarnings<return>
