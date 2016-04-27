noremap <LocalLeader>r :<c-u>Dispatch gradle --daemon installDebug \| cut -c 1- && adb shell am start -n $(getMainClass.php)<return>
inoremap <LocalLeader>r <esc>:Dispatch gradle --daemon installDebug \| cut -c 1- && adb shell am start -n $(getMainClass.php)<return>
