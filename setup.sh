#! /bin/bash

# every instruction is idempotent so this script can be rerun multiple times

set -uoe pipefail

# install brew
if ! which -s brew; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install cli tools
brew install ripgrep
brew install zsh
brew install wget
brew install jq
# nb: awscli also installs python3
brew install awscli

# dev tools, needed for building some python packages
brew install automake libtool

# set zsh as default shell
chsh -s /bin/zsh

# install oh-my-zsh
if [[ ! -d ~/.oh-my-zsh ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
fi

# install zgen
if [[ ! -d ~/.zgen ]]; then
    git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi


# install fzf + key bindings
brew install fzf
$(brew --prefix)/opt/fzf/install

# install z
brew install z
if ! grep -qF "z.sh" ~/.zshrc; then
    echo ". /usr/local/etc/profile.d/z.sh" >> ~/.zshrc
fi

# install python
brew install pyenv
pyenv install 3.6.9
if ! grep -qF "pyenv init" ~/.zshrc; then
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
fi

brew install pyenv-virtualenvwrapper
if ! grep -sqF "virtualenvwrapper" ~/.zshrc; then
    echo "pyenv virtualenvwrapper_lazy" >> ~/.zshrc
fi

# install java
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk11

# install mac apps
brew cask install visual-studio-code
brew cask install macbreakz
brew cask install dropbox
brew cask install spotify
brew cask install go2shell
brew cask install intellij-idea-ce
brew cask install docker
brew cask install firefox
brew cask install authy
brew cask install iterm2

if [[ ! -d "/Applications/VLC.app" ]]; then
    brew cask install vlc
fi

if [[ ! -d "/Applications/Google Chrome.app" ]]; then
    brew cask install google-chrome
fi


# specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/Dropbox/Mackup/Library/Preferences"
# use the custom preferences directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
# save changes to the customer preferences directory
defaults write com.googlecode.iterm2.plist NoSyncNeverRemindPrefsChangesLostForFile_selection -bool false

brew tap homebrew/cask-drivers
brew cask install evoluent-vertical-mouse-device-controller

# Save screenshots to Downloads
defaults write com.apple.screencapture location -string "${HOME}/Downloads"

# Finder settings
# ---------------

# show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, use the previous search scope
defaults write com.apple.finder FXDefaultSearchScope -string "SCsp"

## vim settings
if [[ ! -d ~/.vim_runtime ]]; then
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
fi

## git settings

# Automatically appends '--rebase' to 'git pull' commands; can be overridden with --no-rebase
# If the origin has been force updated since you last pulled, this will silently rewrite your local history to match the origin
# Do this before cloning the repository so branches inherit this setting as they are used
git config --global branch.autoSetupRebase always 
# To retroactively apply it to an already pulled branch: git config branch.<branchname>.rebase true

# When set to true, automatically create a temporary stash entry before the operation begins, and apply it after the operation ends. 
# This means that you can run rebase on a dirty worktree without the message "error: cannot pull with rebase: You have unstaged changes" 
git config --global rebase.autoStash true

git config --global core.autocrlf false      # checkout as-is, commit as-is
git config --global rebase.autosquash true   # merge squash & fixup commits see https://robots.thoughtbot.com/autosquashing-git-commits
 
git config --global user.name "Oliver Mannion"
git config --global user.email 125105+tekumara@users.noreply.github.com