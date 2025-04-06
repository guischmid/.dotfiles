# 🛠️ Dotfiles

These are my personal configuration files, managed with a [bare Git repo](https://www.atlassian.com/git/tutorials/dotfiles).  
I use this to version-control my setup across machines.

## 🔧 Managed Tools

- [Doom Emacs](https://github.com/doomemacs/doomemacs) — `~/.config/doom/`
- [Kitty Terminal](https://sw.kovidgoyal.net/kitty/) — `~/.config/kitty/`
- [LazyVim](https://lazyvim.github.io/) — `~/.config/nvim/`
- `.gitconfig` — global Git configuration
- `.zshrc`, `.aliases`, etc.
- Other configs as needed...

## 🐚 Setup Instructions (for a new machine)

```bash
# Clone the repo as a bare repo
git clone --bare git@github.com:<yourusername>/dotfiles.git $HOME/.dotfiles

# Define the alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Try checking out the files
dotfiles checkout

# If errors occur (e.g., file already exists), back up and retry:
# mv .zshrc .zshrc.backup && dotfiles checkout

# Set up ignore rules and push configuration
dotfiles config --local status.showUntrackedFiles no
