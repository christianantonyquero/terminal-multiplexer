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
// Javascript code with syntax highlighting.
echo "THIS IS TERMINAL MULTIPLEXER"
source ~/.bashrc

S=$(readlink -f $0)

main()
{
    set -e
    unset TMUX
    export session=${1:-unnamed$$}+ty
    [ ${1:-"-i"} = '-b' ] && prefix="batch" || prefix="tmux"
    ${prefix}_new_session "$RUN_L2" l2
    ${prefix}_new_pane "$RUN_L3" l3
    ${prefix}_new_tpane
    ${prefix}_last_pane "wtsscript"
    code=$?
    echo "done $code"
    return $code
}

tmux_new_session()
{
    tmux new -d -s "$session" "/bin/bash; tmux kill-session -t $session"
    tmux set-option -t "$session" prefix 'C-f'
    tmux rename-window -t "$session" tick
    tmux send-keys -t $session:"tick" "($1 |& tee ../L1Bypass_Logs/host-$2.log)" Enter
}

```


* * *

*   #[Sorting visualizer](https://christianantonyquero.github.io/visualizer).
  - I created a sorting visualizer this project is inspired by Clement Mihailescu's #[sorting visualizer](https://clementmihailescu.github.io/Sorting-Visualizer/).
  - "An algorithm must be seen to be believed." -Donald Knuth

* * *
