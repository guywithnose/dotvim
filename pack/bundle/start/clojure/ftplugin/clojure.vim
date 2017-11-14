noremap  <LocalLeader>nc :!TMUX= tmux new-session -d leinServer<return><return>
noremap  <LocalLeader>c :<c-u>Connect nrepl://localhost:8040 ~/<return><return>
noremap  <LocalLeader>ev :<c-u>%Eval<return>
