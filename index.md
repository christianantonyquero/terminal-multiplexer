---
layout: default
---
## GitHub Page
<script type="text/javascript" src="https://platform.linkedin.com/badges/js/profile.js" async defer></script>
<div class="LI-profile-badge"  data-version="v1" data-size="large" data-locale="en_US" data-type="vertical" data-theme="dark" data-vanity="christianquero"><a class="LI-simple-link" href='https://ph.linkedin.com/in/christianquero?trk=profile-badge'>Christian Antony Quero</a></div>
<div>
  <h2 class="text">Codewars Badge</h2>
  <a target="_blank" href="https://www.codewars.com/users/christianantonyquero"><img src="https://www.codewars.com/users/christianantonyquero/badges/large" alt="codewars badge large" /></a>
</div>

#### Terminal Multiplexer

```bash
//tmux.sh

pyServer="cd /var/fpwork/quero/python/ && python SCTP_Server.py 127.0.0.1 7777"
pyClient="cd /var/fpwork/quero/python/ && python SCTP_Client.py 127.0.0.1 7777"

echo "THIS IS TERMINAL MULTIPLEXER"
source ~/.bashrc

S=$(readlink -f $0)

main()
{
    set -e
    unset TMUX
    export session=${1:-sessionName$$}
    echo "$session"
    prefix="tmux"
    ${prefix}_new_session "$pyServer" pyServer
    sleep 1
    ${prefix}_new_pane "$pyClient" pyClient
    sleep 1
    ${prefix}_new_tpane "$pyClient" pyClient
    ${prefix}_last_pane "Script to chat"
    code=$?
    echo "done $code"
    return $code
}

tmux_new_session()
{
    tmux new -d -s "$session" "/bin/bash; tmux kill-session -t $session"
    tmux set-option -t "$session" prefix 'C-f'
    # The prefix will be your hotkey to trigger actions using this terminal. C-f means control+f
    # For example to change panes, Press ctrl+f, q <Number of Pane> The panes are numbered starting from 0
    tmux rename-window -t "$session" tick
    tmux send-keys -t $session:"tick" "$1" Enter
}

tmux_new_pane()
{
    tmux split -t "$session" -v "/bin/bash; tmux kill-session -t $session"
    tmux send-keys -t $session:"tick" "$1" Enter
    tmux select-layout -t "$session" tiled
}

tmux_new_tpane()
{
    tmux split -t "$session" -v "/bin/bash; tmux kill-session -t $session"
    tmux send-keys -t $session:"tick" "$1" Enter
    tmux select-layout -t "$session" tiled
}

tmux_last_pane()
{
    echo $@
    tmux split -t "$session" -v "/bin/bash; tmux kill-session -t $session"
    tmux select-layout -t "$session" tiled
    tmux send-keys -t $session:"tick" "./ChatScript.sh" Enter
    tmux attach -t "$session"
}

[ "$0" = "$BASH_SOURCE" ] && main "$@"
```

```bash
//ChatScript.sh
sleep 3s
tmux send-keys -t 1 'Hi' Enter
sleep 1s
tmux send-keys -t 2 'Hello' Enter
sleep 1s
tmux send-keys -t 1 'What is your name?' Enter
sleep 1s
tmux send-keys -t 2 'My name is Christian Antony Quero' Enter

```

## Notes
> Make sure to 'chmod +x <.sh file>' the shell scripts so that it will be executable.

> Make sure that the line endings of the scripts are LF (Linux) and not CRLF (Windows).

[TMUX Cheat Sheet / Hot keys](https://tmuxcheatsheet.com/)


The chatroom code can be seen here.
[Simple chat room using python](https://www.geeksforgeeks.org/simple-chat-room-using-python/).


* * *

*   [Sorting visualizer](https://christianantonyquero.github.io/visualizer).
  - I created a sorting visualizer this project is inspired by Clement Mihailescu's [sorting visualizer](https://clementmihailescu.github.io/Sorting-Visualizer/).
  - "An algorithm must be seen to be believed." -Donald Knuth

* * *
