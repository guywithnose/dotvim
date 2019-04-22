command! Phpunit Dispatch phpunit --exclude-group slow --verbose --debug --stop-on-failure % | perl -p -e 's/Starting test '\''(.*)'\''\.\n/\1/'
command! PhpunitCoverage Dispatch phpunit --verbose --debug --stop-on-failure --coverage-html coverage %
command! PhpunitCurrentFunction execute "Dispatch phpunit --exclude-group slow --verbose --debug --stop-on-failure --filter '/::" . cfi#get_func_name() . "\(\ \|$\)/' %"
command! PhpunitCurrentFunctionCoverage execute "Dispatch phpunit --verbose --debug --coverage-html coverage --stop-on-failure --filter '/::" . cfi#get_func_name() . "$/' %"
command! PhpunitCurrentFunctionFast execute "Dispatch phpunit --exclude-group slow --verbose --debug --stop-on-failure --filter '/::" . cfi#get_func_name() . "$/' %"

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

noremap <LocalLeader>T :call php#OpenTestFile()<return>
inoremap <LocalLeader>T <esc>:call php#OpenTestFile()<return>
