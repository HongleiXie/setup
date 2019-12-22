zmodload zsh/zprof

ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)

# Disable oh-my-zsh autoupdate, rely on zgen to update it
DISABLE_AUTO_UPDATE=true

# do this up-front because scmbreeze needs compdef 
autoload -Uz compinit && \
   compinit -C 

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then
  echo "Creating a zgen save"

  # Automatically run zgen update and zgen selfupdate every 7 days.
  zgen load unixorn/autoupdate-zgen

  # load default modules
  zgen prezto

  # load additional modules
  # zgen prezto git

  # when pressing up/down arrows, completes the beginning of a command by searching in the history
  zgen prezto history-substring-search

  # theme
  zgen prezto prompt theme 'pure'
  zgen prezto '*:*' color 'yes'

  #zgen prezto python

  #zgen oh-my-zsh plugins/kubectl
  # zgen oh-my-zsh
  # zgen oh-my-zsh plugins/git
  # zgen oh-my-zsh themes/robbyrussell

  zgen load skywind3000/z.lua
  zgen load scmbreeze/scm_breeze
  zgen load zdharma/fast-syntax-highlighting
  # zgen load zsh-users/zsh-autosuggestions
  # zgen load zsh-users/zsh-syntax-highlighting

  #zgen load junegunn/fzf shell
  #if [[ -f ~/.fzf.zsh ]]; then
  #zgen load ~/.fzf.zsh
  #fi

  zgen load "$HOME/.zshrc.d/golang.zsh"
  zgen load "$HOME/.zshrc.d/awsweb.zsh"
  zgen load "$HOME/Dropbox/Slack/functions.zsh"

  # dynamically load anything in the work directory
  # this won't be under source control 
  for zshfile in "${ZDOTDIR:-$HOME}"/.zshrc.d/work/*.zsh; do
    echo "load $zshfile"
    zgen load "$zshfile"
  done

  # generate the init script for everything above
  zgen save

  # zcompile ${ZDOTDIR:-${HOME}}/.zgen/init.zsh
fi

# allow overwriting existing files
# (this is unset by the prezto directory module)
setopt CLOBBER

# set prezto to use same history file as oh-my-zsh
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000

# fzf keybindings (CTRL-T, CTRL-R) must be loaded after the prezto editor module
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# pyenv + virtualenvwrapper
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
pyenv virtualenvwrapper_lazy

# added by pipx
export PATH="$PATH:$HOME/.local/bin"