nmap <LocalLeader>sm :<c-u>Dispatch devMaria -e <c-r>=shellescape(getline('.') . '; commit;')<return><return>
imap <LocalLeader>sm <c-o>:<c-u>Dispatch devMaria -e <c-r>=shellescape(getline('.') . '; commit;')<return><return>
nmap <LocalLeader>r :<c-u>Dispatch devMaria < %<return>
imap <LocalLeader>r <c-o>:<c-u>Dispatch devMaria < %<return>
