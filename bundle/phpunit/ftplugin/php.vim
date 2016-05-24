command! Phpunit TestFile --bootstrap tests/progressBootstrap.php --exclude-group slow --verbose --stop-on-failure
command! PhpunitCoverage TestFile --bootstrap tests/progressBootstrap.php --verbose --stop-on-failure --coverage-html coverage
command! PhpunitCurrentFunction TestNearest --bootstrap tests/progressBootstrap.php --exclude-group slow --verbose --stop-on-failure
command! PhpunitCurrentFunctionCoverage TestNearest --bootstrap tests/progressBootstrap.php --verbose --coverage-html coverage --stop-on-failure
command! PhpunitCurrentFunctionFast TestNearest --bootstrap tests/fastbootstrap.php --exclude-group slow --verbose --stop-on-failure

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
