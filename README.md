# Jashby's Dotfiles

This repo is a [bare git repo](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html).

To set up on a new machine:
```shell
echo ".dotfiles.git" >> .gitignore
git clone --bare https://www.github.com/JoshAshby/dots.git $HOME/.dotfiles.git

# Might need to restart fish to get it to apply the new alias from the config

dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```
