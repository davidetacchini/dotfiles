#!/usr/bin/env bash
# Fix catppuccin rounded separators for transparent status bars.
# The plugin's reverse trick can't produce bg=default, so we reconstruct
# separator styles with explicit fg=<pill_color>,bg=default.

crust=$(tmux show -gqv @thm_crust)
num=$(tmux show -gqv @catppuccin_window_number_color)
txt=$(tmux show -gqv @catppuccin_window_text_color)
cnum=$(tmux show -gqv @catppuccin_window_current_number_color)
ctxt=$(tmux show -gqv @catppuccin_window_current_text_color)

for kind in "" "current-"; do
  [[ $kind == "" ]] && n=$num t=$txt || n=$cnum t=$ctxt

  fmt=$(tmux show -gqv "window-status-${kind}format")

  # Left sep: replace num_style + reverse separator with transparent sep + restored num_style
  fmt=$(printf '%s' "$fmt" \
    | sed "s|#\[fg=${crust},bg=${n}\]#\[fg=none,reverse\]\([^#]*\)#\[none\]|#[fg=${n},bg=default]\1#[fg=${crust},bg=${n}]|")

  # Right sep: replace reverse separator with transparent sep
  fmt=$(printf '%s' "$fmt" \
    | sed "s|#\[fg=none,reverse\]\([^#]*\)#\[none\]|#[fg=${t},bg=default]\1#[none]|")

  tmux set -g "window-status-${kind}format" "$fmt"
done
