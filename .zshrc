fpath=($fpath "/home/teplo/.zfunctions")

setopt prompt_subst

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b'

NEW_LINE=$'\n'
PROMPT="$NEW_LINE%B%F{39}%~%b%f ${vcs_info_msg_0_}$NEW_LINE%(?.%F{40}.%F{161})➜%f%b "

# Alias to get more info from ls
alias ll="ls -lah"

# Loading nvm
export NVM_DIR="$HOME/.nvm"
source $NVM_DIR/nvm.sh

