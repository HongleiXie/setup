# setup

[![Build](https://github.com/tekumara/setup/actions/workflows/ci.yml/badge.svg)](https://github.com/tekumara/setup/actions/workflows/ci.yml)

Contains installation scripts, .zshrc and dotfiles for a minimal, fast (120ms startup) zsh experience.

Run `./install.sh` to install and configure a fresh mac. Run it again to upgrade to the latest versions.


## bench

```
hyperfine --warmup 3 'zsh -i -c exit;'
```
