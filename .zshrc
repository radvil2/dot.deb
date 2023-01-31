# source custom aliases & env
source $HOME/.radvil/aliases
source $HOME/.radvil/env

# set default prompt to starship
eval "$(starship init zsh)"

# replace cd with zoxide
eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
