# --- Appearance / Environment ---
export CLICOLOR=1
export LANG="en_US.UTF-8"
export TERMINFO_DIRS="${TERMINFO_DIRS:+$TERMINFO_DIRS:}$HOME/.local/share/terminfo"

# --- vcs_info setup for git branch ---
autoload -Uz vcs_info add-zsh-hook
zstyle ':vcs_info:git:*' formats ' %F{158}( %b)%f'
add-zsh-hook precmd vcs_info

# --- Prompt ---
setopt PROMPT_SUBST
# %n = user, %m = host, %~ = working dir
PROMPT='%F{153}%n@%m%f%F{224} %~%f${vcs_info_msg_0_} %F{153}❯%f '

# Default editor
export EDITOR="vim"

# Compiler
export CC="/usr/bin/clang"

# Homebrew
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_BUNDLE_FILE="$HOME/brew/Brewfile"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Paths
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && source "/opt/homebrew/opt/nvm/nvm.sh"

# Custom completions (pnpm, Docker) -- must be set before zinit/zsh-autocomplete calls compinit
fpath=($HOME/.zsh/completions $HOME/.docker/completions $fpath)

# Zinit and plugins
if [[ -f /opt/homebrew/opt/zinit/zinit.zsh ]]; then
  source /opt/homebrew/opt/zinit/zinit.zsh

  zinit light zsh-users/zsh-autosuggestions
  zinit light zsh-users/zsh-syntax-highlighting
  zinit light zsh-users/zsh-completions

  zstyle ':autocomplete:*' delay 0.15
  zstyle ':autocomplete:*' timeout 3.0
  zstyle ':autocomplete:*' min-input 2
  zinit light marlonrichert/zsh-autocomplete

  zinit light g-plane/pnpm-shell-completion
fi

[[ -f ~/.zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh ]] && source ~/.zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh

# --- Aliases ---
alias vi="nvim"
alias ae="source .venv/bin/activate"
alias pipcs="pip-compile --no-annotate && pip-sync"
alias djrun="python manage.py runserver"
alias djmk="python manage.py makemigrations && echo '--- Migrations made ---' && python manage.py migrate"
alias lg="lazygit"
alias lk="lazydocker"
alias claude="DISABLED_AUTOUPDATER=1 claude"

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
