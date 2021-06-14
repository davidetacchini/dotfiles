export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export PATH="/usr/local/opt/python@3.9/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export CC=/usr/bin/clang
export CLICOLOR=1
export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

source ~/.custom_commands.sh

autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:git:*' formats ' %F{red}(%b)%f'
setopt PROMPT_SUBST
PROMPT='%F{green}%n@%m%f %F{blue}%~%f${vcs_info_msg_0_} %F{yellow}✗%f '

alias config="/usr/bin/git --git-dir=$HOME/.config.git/ --work-tree=$HOME"
