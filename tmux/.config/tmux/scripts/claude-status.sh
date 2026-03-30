#!/usr/bin/env bash

set -euo pipefail

STATUS_DIR="$HOME/.cache/tmux-claude-status"

fg=$(tmux show -gqv @thm_fg)
surface=$(tmux show -gqv @thm_surface_0)
green=$(tmux show -gqv @thm_green)
yellow=$(tmux show -gqv @thm_yellow)

total=0
working=0

while IFS=$'\t' read -r pane_id pane_cmd; do
    [[ "$pane_cmd" == "claude" ]] || continue
    ((total++)) || true

    status_file="$STATUS_DIR/${pane_id}.status"
    if [ -f "$status_file" ] && [[ "$(cat "$status_file" 2>/dev/null)" == "working" ]]; then
        ((working++)) || true
    fi
done < <(tmux list-panes -a -F "#{pane_id}	#{pane_current_command}" 2>/dev/null)

idle=$((total - working))

TXT="#[fg=${fg},bg=${surface}]"
echo "#[fg=${green}]●${TXT} ${working} #[fg=${yellow}]●${TXT} ${idle}"
