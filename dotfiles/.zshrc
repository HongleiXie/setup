export ZPLUG_HOME=/usr/local/opt/zplug

source $ZPLUG_HOME/init.zsh

# zsh plugins
# Start sensibly!
zplug "yous/vanilli.sh"
zplug "chrissicool/zsh-256color"
zplug "junegunn/fzf", use:shell/key-bindings.zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zdharma/fast-syntax-highlighting"
zplug "plugins/pyenv", from:oh-my-zsh

# Nice prompt
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose