nmap <LocalLeader>sm :<c-u>Dispatch mysql -hdsdwsmadevdb02.traderonline.com -ucoldfusion -p'GvKhoylxbK6RmG6hqOZYCsge' traderadm -e <c-r>=shellescape(getline('.') . '; commit;')<return><return>
imap <LocalLeader>sm <c-o>:<c-u>Dispatch mysql -hdsdwsmadevdb02.traderonline.com -ucoldfusion -p'GvKhoylxbK6RmG6hqOZYCsge' traderadm -e <c-r>=shellescape(getline('.') . '; commit;')<return><return>
nmap <LocalLeader>r :<c-u>Dispatch mysql -hdsdwsmadevdb02.traderonline.com -ucoldfusion -p'GvKhoylxbK6RmG6hqOZYCsge' traderadm < %<return>
imap <LocalLeader>r <c-o>:<c-u>Dispatch mysql -hdsdwsmadevdb02.traderonline.com -ucoldfusion -p'GvKhoylxbK6RmG6hqOZYCsge' traderadm < %<return>
