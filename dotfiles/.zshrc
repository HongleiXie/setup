[[ -d ~/.zplug ]] || {
	git clone https://github.com/zplug/zplug ~/.zplug
	source ~/.zplug/init.zsh && zplug update --self
}

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

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
