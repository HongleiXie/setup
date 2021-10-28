# setup

[![Build](https://github.com/tekumara/setup/actions/workflows/ci.yml/badge.svg)](https://github.com/tekumara/setup/actions/workflows/ci.yml)

Contains installation scripts, .zshrc and dotfiles for a minimal, fast (120ms startup) zsh experience.

Run `./install.sh` to install and configure a fresh mac. Run it again to upgrade to the latest versions.

## Oh-My-Zsh

Install:

```bash
export REMOTE=https://gitee.com/imirror/ohmyzsh.git
sh -c "$(curl -fsSL https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/tools/install.sh)"
```

```bash
git clone https://gitee.com/imirror/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://gitee.com/imirror/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Adding the following in the `~/.zshrc`

```bash
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

Now `source ~/.zshrc` to make it effective.
