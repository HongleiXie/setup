#!/usr/bin/env bash

# every instruction is idempotent so this script can be rerun multiple times

set -euo pipefail

# install brew
if ! hash brew; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    echo brew update ...
    brew update
fi

# install packages in Brewfile
brew bundle install --verbose --no-lock --file install/Brewfile

# rehash shims in case we've just upgraded pyenv via brew
pyenv rehash

# install fzf key bindings & fuzzy completion and update zshrc
"$(brew --prefix)"/opt/fzf/install --all --no-bash

# install docker zsh completions
etc=/Applications/Docker.app/Contents/Resources/etc
ln -fs "$etc"/docker.zsh-completion /usr/local/share/zsh/site-functions/_docker

# golang tools
go get -u github.com/go-delve/delve/cmd/dlv

# python tools
# NB: pipx installed packages use the system version of python
pipx install --force py-spy

# for formatting markdown, json and javscript
npm install -g prettier
