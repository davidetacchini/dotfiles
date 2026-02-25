# Suppress shell warnings and set appearance
export BASH_SILENCE_DEPRECATION_WARNING=1
export CLICOLOR=1
export LANG="en_US.UTF-8"
export TERMINFO_DIRS="${TERMINFO_DIRS:+$TERMINFO_DIRS:}$HOME/.local/share/terminfo"

# Prompt appearance
export PS1="\[\e[32m\]\u@\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]$ \[$(tput sgr0)\]"

# Default editor
export EDITOR="vim"

# Compiler
export CC="/usr/bin/clang"

# Homebrew-related configuration
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_BUNDLE_FILE="$HOME/brew/Brewfile"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add Homebrew paths
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

# Aliases
alias vi="nvim"
alias ae="source .venv/bin/activate"
alias pipcs="pip-compile --no-annotate && pip-sync"
alias djrun="python manage.py runserver"
alias djmk="python manage.py makemigrations && echo '--- Migrations made ---' && python manage.py migrate"
alias lg="lazygit"
alias lk="lazydocker"

# Prevents Claude's auto-updater from running.
# Using an alias instead of exporting globally to avoid breaking other tools
# that might rely on DISABLED_AUTOUPDATER.
alias claude="DISABLED_AUTOUPDATER=1 claude"

# uv global Python
[[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && export PATH="$HOME/.local/bin:$PATH"

# pipx binaries
[[ ":$PATH:" != *":$HOME/.local/pipx/bin:"* ]] && export PATH="$HOME/.local/pipx/bin:$PATH"
