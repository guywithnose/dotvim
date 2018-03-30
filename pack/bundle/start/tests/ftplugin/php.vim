command! Phpunit TestFile --exclude-group slow --verbose --stop-on-failure
command! PhpunitCoverage TestFile --verbose --stop-on-failure --coverage-html coverage
command! PhpunitCurrentFunction TestNearest --exclude-group slow --verbose --stop-on-failure
command! PhpunitCurrentFunctionCoverage TestNearest --verbose --coverage-html coverage --stop-on-failure
command! PhpunitCurrentFunctionFast TestNearest --exclude-group slow --verbose --stop-on-failure

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
