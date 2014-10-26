noremap <LocalLeader>dd :update<return>:call docker#build()<return>
inoremap <LocalLeader>dd <esc>:update<return>:call docker#build()<return>
noremap <LocalLeader>db :update<return>:call docker#build('bash')<return>
inoremap <LocalLeader>db <esc>:update<return>:call docker#build('bash')<return>
