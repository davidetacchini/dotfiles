#!/usr/bin/env bash

set -euo pipefail

STATUS_DIR="$HOME/.cache/tmux-claude-status"

fg=$(tmux show -gqv @thm_fg)
surface=$(tmux show -gqv @thm_surface_0)
green=$(tmux show -gqv @thm_green)
peach=$(tmux show -gqv @thm_peach)
yellow=$(tmux show -gqv @thm_yellow)

total=0
working=0
waiting=0

while IFS=$'\t' read -r pane_id pane_cmd; do
    [[ "$pane_cmd" == "claude" ]] || continue
    ((total++)) || true

    status_file="$STATUS_DIR/${pane_id}.status"
    if [ -f "$status_file" ]; then
        pane_status=$(cat "$status_file" 2>/dev/null)
        if [[ "$pane_status" == "working" ]]; then
            ((working++)) || true
        elif [[ "$pane_status" == "waiting" ]]; then
            ((waiting++)) || true
        fi
    fi
done < <(tmux list-panes -a -F "#{pane_id}	#{pane_current_command}" 2>/dev/null)

idle=$((total - working - waiting))

TXT="#[fg=${fg},bg=${surface}]"
echo "#[fg=${green}]●${TXT} ${working} #[fg=${peach}]●${TXT} ${waiting} #[fg=${yellow}]●${TXT} ${idle}"
