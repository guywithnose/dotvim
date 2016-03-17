" Fallback to normal execution if vim-dispatch is not installed
silent! command -nargs=* Dispatch execute "!" . <q-args>

command! Phpunit Dispatch phpunit --bootstrap tests/fastbootstrap.php --exclude-group slow --verbose --debug --stop-on-failure % | perl -p -e 's/Starting test '\''(.*)'\''\.\n/\1/'
command! PhpunitCoverage Dispatch phpunit --bootstrap tests/progressBootstrap.php --verbose --debug --stop-on-failure --coverage-html coverage %
command! PhpunitCurrentFunction execute "Dispatch phpunit --bootstrap tests/progressBootstrap.php --exclude-group slow --verbose --debug --stop-on-failure --filter '/::" . cfi#get_func_name() . "$/' %"
command! PhpunitCurrentFunctionCoverage execute "Dispatch phpunit --bootstrap tests/progressBootstrap.php --verbose --debug --coverage-html coverage --stop-on-failure --filter '/::" . cfi#get_func_name() . "$/' %"
command! PhpunitCurrentFunctionFast execute "Dispatch phpunit --bootstrap tests/fastbootstrap.php --exclude-group slow --verbose --debug --stop-on-failure --filter '/::" . cfi#get_func_name() . "$/' %"

noremap <LocalLeader>t :update<return>:Phpunit<return>
inoremap <LocalLeader>t <esc>:update<return>:Phpunit<return>
noremap <LocalLeader>ct :update<return>:PhpunitCoverage<return>
inoremap <LocalLeader>ct <esc>:update<return>:PhpunitCoverage<return>
noremap <LocalLeader>f :update<return>:PhpunitCurrentFunction<return>
inoremap <LocalLeader>f <esc>:update<return>:PhpunitCurrentFunction<return>
noremap <LocalLeader>sf :update<return>:PhpunitCurrentFunctionFast<return>
inoremap <LocalLeader>sf <esc>:update<return>:PhpunitCurrentFunctionFast<return>
noremap <LocalLeader>cf :update<return>:PhpunitCurrentFunctionCoverage<return>
inoremap <LocalLeader>cf <esc>:update<return>:PhpunitCurrentFunctionCoverage<return>
