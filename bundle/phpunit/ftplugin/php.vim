command! Phpunit Dispatch phpunit --stop-on-failure %
command! PhpunitCoverage Dispatch phpunit --stop-on-failure --coverage-html coverage %
command! PhpunitCurrentFunction execute "Dispatch phpunit --verbose --filter '::" . cfi#get_func_name() . "$' %"
command! PhpunitCurrentFunctionCoverage execute "Dispatch phpunit --verbose --coverage-html coverage --filter '::" . cfi#get_func_name() . "$' %"

noremap <LocalLeader>t :update<return>:Phpunit<return>
inoremap <LocalLeader>t <esc>:update<return>:Phpunit<return>
noremap <LocalLeader>ct :update<return>:PhpunitCoverage<return>
inoremap <LocalLeader>ct <esc>:update<return>:PhpunitCoverage<return>
noremap <LocalLeader>f :update<return>:PhpunitCurrentFunction<return>
inoremap <LocalLeader>f <esc>:update<return>:PhpunitCurrentFunction<return>
noremap <LocalLeader>cf :update<return>:PhpunitCurrentFunctionCoverage<return>
inoremap <LocalLeader>cf <esc>:update<return>:PhpunitCurrentFunctionCoverage<return>
