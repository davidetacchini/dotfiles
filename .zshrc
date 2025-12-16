# --- Appearance / Environment ---
export CLICOLOR=1
export LANG="en_US.UTF-8"
export TERMINFO_DIRS="$TERMINFO_DIRS:$HOME/.local/share/terminfo"
export TERM=xterm-256color

# --- vcs_info setup for git branch ---
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats ' %F{141}( %b)%f'
precmd() {
  vcs_info
}

# --- Prompt ---
# %n = user, %m = host, %~ = working dir
PROMPT='%F{114}%n@%m%f%F{111} %~%f${vcs_info_msg_0_}%F{147} %f '

# Default editor
export EDITOR="vim"

# Compiler
export CC="/usr/bin/clang"

# Homebrew
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_BUNDLE_FILE="$HOME/brew/Brewfile"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Paths
export PATH="/opt/homebrew/opt/sbin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && source "/opt/homebrew/opt/nvm/nvm.sh"

# API Keys
export ANTHROPIC_API_KEY=$(< ~/.anthropic_api_key)
export GEMINI_API_KEY=$(< ~/.gemini_api_key)

# Active zinit installed via homebrew
source /opt/homebrew/opt/zinit/zinit.zsh

# Example useful plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light olivierverdier/zsh-git-prompt
zinit light marlonrichert/zsh-autocomplete

# I don't like the underline style
# ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
source ~/.zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh

# --- Aliases ---
alias vi="nvim"
alias ae="source .venv/bin/activate"
alias pipcs="pip-compile --no-annotate && pip-sync"
alias djrun="python manage.py runserver"
alias djmk="python manage.py makemigrations && echo '--- Migrations made ---' && python manage.py migrate"
alias lg="lazygit"
alias lk="lazydocker"
alias claude="DISABLED_AUTOUPDATER=1 claude"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=($HOME/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

path_add() {
  case ":$PATH:" in
    *":$1:"*) ;;  # already there
    *) PATH="$1:$PATH";;
  esac
}

# uv global Python
path_add "$HOME/.local/bin"

# pipx binaries
path_add "$HOME/.local/pipx/bin"
