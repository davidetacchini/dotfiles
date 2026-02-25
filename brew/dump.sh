#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
brew bundle dump --brews --casks --taps --mas --force --file="$SCRIPT_DIR/Brewfile"
