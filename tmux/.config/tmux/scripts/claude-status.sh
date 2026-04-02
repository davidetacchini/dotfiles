#!/usr/bin/env bash

set -euo pipefail

PLUGIN_DIR="$HOME/.config/tmux/plugins/tmux-claude-status"
source "$PLUGIN_DIR/scripts/helpers.sh"

STATUS_DIR="$HOME/.cache/tmux-claude-status"

fg=$(tmux show -gqv @thm_fg)
surface=$(tmux show -gqv @thm_surface_0)
green=$(tmux show -gqv @thm_green)
peach=$(tmux show -gqv @thm_peach)
yellow=$(tmux show -gqv @thm_yellow)

total=0
working=0
waiting=0

claude_panes=$(get_claude_panes)

while read -r pane_id; do
    [ -n "$pane_id" ] || continue
    status_file="$STATUS_DIR/${pane_id}.status"
    [ -f "$status_file" ] || continue

    ((total++)) || true
    pane_status=$(cat "$status_file" 2>/dev/null)
    if [[ "$pane_status" == "working" ]]; then
        ((working++)) || true
    elif [[ "$pane_status" == "waiting" ]]; then
        ((waiting++)) || true
    fi
done <<< "$claude_panes"

idle=$((total - working - waiting))

TXT="#[fg=${fg},bg=${surface}]"
echo "#[fg=${green}]●${TXT} ${working} #[fg=${peach}]●${TXT} ${waiting} #[fg=${yellow}]●${TXT} ${idle}"
