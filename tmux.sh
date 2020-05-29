
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
