noremap  <LocalLeader>c :<c-u>Connect nrepl://localhost:8040 fnamemodify(expand('%'), ':p:s?.*\zs[\/]src[\/].*??')<return><return>
noremap  <LocalLeader>ev :<c-u>%Eval<return>
