command! PhpCs !php -l % && phpcs -n %
command! PhpCsNoWarnings !php -l % && phpcs %

noremap <LocalLeader>cs :update<return>:PhpCs<return>
inoremap <LocalLeader>cs <esc>:update<return>:PhpCs<return>
noremap <LocalLeader>ns :update<return>:PhpCsNoWarnings<return>
inoremap <LocalLeader>ns <esc>:update<return>:PhpCsNoWarnings<return>
