# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/chris/.zsh/completions:"* ]]; then export FPATH="/Users/chris/.zsh/completions:$FPATH"; fi


# customize prompt: `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# aliases
alias dotfiles="/usr/bin/git --git-dir=${HOME}/.dotfiles/.git/ --work-tree=${HOME}"
alias zsh-reload='source ~/.zshrc'
alias zsh-edit='vim ~/.zshrc'
alias openports='lsof -P -iTCP -sTCP:LISTEN +c0'

typeset -U path
path=($HOME/bin $HOME/.local/bin /usr/local/bin $path)

# oh-my-zsh
export ZSH="${HOME}/.oh-my-zsh"
zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 1
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"

# ENABLE_CORRECTION="true"

plugins=(
  git
  kubectl
  history
  emoji
  encode64
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

test -e "$HOME/.iterm2_shell_integration.zsh" && source "$HOME/.iterm2_shell_integration.zsh"
test -e "$HOME/.deno/env" && . "$HOME/.deno/env"
# nvm (Homebrew)
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# ghcup (Haskell)
[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env" # ghcup-env

# thefuck
eval $(thefuck --alias)
