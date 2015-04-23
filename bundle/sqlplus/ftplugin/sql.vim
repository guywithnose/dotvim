nmap <LocalLeader>sd :<c-u>Dispatch echo -e 'SET LINESIZE 32767\nSET TRIMOUT ON\n' <c-r>=shellescape(escape(getline('.'), '!'))<return>\|sqlplus -S<return>
nmap <LocalLeader>sp :<c-u>Dispatch echo -e 'SET LINESIZE 32767\nSET TRIMOUT ON\n' <c-r>=shellescape(escape(getline('.'), '!'))<return>\|sqlplusLive -S<return>
nmap <LocalLeader>sd :<c-u>Dispatch echo -e 'SET TRIMOUT ON\n' <c-r>=shellescape(escape(getline('.'), '!'))<return>\|sqlplus -S<return>
nmap <LocalLeader>sp :<c-u>Dispatch echo -e 'SET TRIMOUT ON\n' <c-r>=shellescape(escape(getline('.'), '!'))<return>\|sqlplusLive -S<return>
