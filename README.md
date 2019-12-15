# DropD dotfiles

## zsh setup

zsh/zshrc -> ~/.zshrc
zsh/antibody_plugins.txt -> ~/.zshrc
zsh/p10k.zsh -> .p10k.zsh

## bash setup

```
bash/bash_profile -> ~/.bash_profile
bash/bashrc -> ~/.bashrc
bash/alias/* -> ~/.config/bash/alias/ # depending on system and program availability
bash/dircolors -> ~/.dircolors # on UNIX
bash/ubuntu_bashrc -> ~/.config/bash/local_bashrc.sh # on ubuntu systems
```

## conda + aiida setup

```
for each <aiida-env>:
    mkdir -p <conda_root>/envs/<aiida-env>/etc/conda/activate.d
    conda/aiida_activate.sh -> <conda_root>/envs/<aiida-env>/etc/conda/activate.d/aiida_activate.sh
```

## git setup

```
git/gitconfig -> ~/.gitconfig
git/ignore -> ~/.config/git/ignore
```

## hammerspoon

```
hammerspoon/init.lua -> ~/.hammerspoon/init.lua
```

## ipython

```
export IPYTHONDIR=~/.config/ipython
ipython profile create
ipython/profile_default/ipython_config.py -> ~/.config/ipython/profile_default/ipython_config.py
```
bashrc takes care of exporting ipythondir if ~/.config/inpython exists

## nvim

```
nvim/init.vim -> ~/.config/nvim/init.vim
nvim/local/* -> ~/.config/nvim/local/
nvim/pm* -> ~/.config/nvim/plugin_manager/
```

to manually configure plugin manager:
edit ~/.config/nvim/local/settings.vim with

```vim
let g:settings = {
\    'plugin_manager' : 'dein' | 'neovim'
\}
```

## xonsh
xonsh/config.json -> ~/.config/xonsh/config.json

## general input mode
inputrc -> ~/.inputrc

## tmux
tmux.conf -> ~/.tmux.conf

## vimperator
vimperatorrc -> ~/.vimperatorrc
vimperatorrc.local -> ~/.vimperatorrc.local
