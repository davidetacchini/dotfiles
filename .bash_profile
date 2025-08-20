# Suppress shell warnings and set appearance
export BASH_SILENCE_DEPRECATION_WARNING=1
export CLICOLOR=1
export LANG="en_US.UTF-8"
export TERMINFO_DIRS="$TERMINFO_DIRS:$HOME/.local/share/terminfo"
export TERM=xterm-256color

# Prompt appearance
export PS1="\[\e[32m\]\u@\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]$ \[$(tput sgr0)\]"

# Default editor and shell
export EDITOR="vim"
export SHELL="/opt/homebrew/bin/bash"

# Compiler
export CC="/usr/bin/clang"

# Homebrew-related configuration
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_BUNDLE_FILE="$HOME/brew/Brewfile"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add Homebrew paths
export PATH="/opt/homebrew/opt/python@3.11/bin:$PATH"
export PATH="/opt/homebrew/opt/python@3.10/bin:$PATH"
export PATH="/opt/homebrew/opt/sbin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

# API Keys
export ANTHROPIC_API_KEY=$(cat ~/.anthropic_api_key)
export GEMINI_API_KEY=$(cat ~/.gemini_api_key)

# Aliases
alias vi="nvim"
alias ae="source .venv/bin/activate"
alias pipcs="pip-compile --no-annotate && pip-sync"
alias djrun="python manage.py runserver"
alias djmk="python manage.py makemigrations && echo '--- Migrations made ---' && python manage.py migrate"
alias ai="source ~/aider/venv/bin/activate"
alias lg="lazygit"
alias lk="lazydocker"
alias claude="~/.claude/local/claude"
