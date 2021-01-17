function! tmxsend#tmxeasy#Send(command,pane)
 execute "!tmux send-key -t "a:pane" "a:command""
endfunction


function! tmxsend#tmxeasy#Tree()
 execute "!tmux choose-tree"
endfunction

