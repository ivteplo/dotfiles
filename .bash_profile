export LC_ALL="en_US.UTF-8"

GIT_PS1_SHOWDIRTYSTATE=true
PS1='\[\e[38;5;2m\]\u \[\e[38;5;39m\]\W\[\e[38;5;208m$(__git_ps1)\] \[\e[0m\]\$ '

# NVM - node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

