#!/usr/bin/env bash

# Claude Code hook — writes working/done status per tmux pane

STATUS_DIR="$HOME/.cache/tmux-agent-status"
mkdir -p "$STATUS_DIR"

cat > /dev/null

[ -z "$TMUX" ] && exit 0

PANE_ID=$(tmux display-message -p '#{pane_id}' 2>/dev/null)
[ -z "$PANE_ID" ] && exit 0

case "$1" in
    "UserPromptSubmit"|"PreToolUse")
        echo "working" > "$STATUS_DIR/${PANE_ID}.status"
        ;;
    "Stop"|"Notification")
        echo "done" > "$STATUS_DIR/${PANE_ID}.status"
        # Clean up stale status files for panes that no longer exist
        for f in "$STATUS_DIR"/*.status; do
            [ -f "$f" ] || continue
            pid=$(basename "$f" .status)
            tmux list-panes -a -F "#{pane_id}" 2>/dev/null | grep -qx "$pid" || rm -f "$f"
        done
        ;;
esac

exit 0
