# Dotfiles

This repository contains configuration files managed using a **bare Git repository**. The Git directory lives in `~/.dotfiles` while the working tree is your home directory. This allows you to version control dotfiles without cluttering your home with `.git` directories.

## Bare repository workflow

1. Clone the repo as a bare repository:
   ```bash
   git clone --bare <repo-url> "$HOME/.dotfiles"
   ```
2. Add a helper alias in your shell (already present in `.zshrc`):
   ```bash
   alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
   ```
3. Configure Git to hide untracked files:
   ```bash
   dotfiles config --local status.showUntrackedFiles no
   ```
4. Use the `dotfiles` alias instead of `git` to manage configuration files. For example:
   ```bash
   dotfiles status
   dotfiles add .zshrc
   dotfiles commit -m "Update zsh config"
   dotfiles push
   ```

## Updating

Pull new changes with:
```bash
dotfiles pull
```
Edit files as normal and commit them with the `dotfiles` alias. Push to your remote to back up changes.

## Directory overview

- `~/.config/kitty/` – Kitty terminal configuration
- `~/.config/nvim/` – LazyVim (Neovim) setup
- `~/.config/fish/` – Fish shell configuration
- `~/.config/neofetch/` – Neofetch settings
- `~/doom.d` – Doom Emacs configuration
- `.zshrc` – Zsh shell settings
- `.dotfiles-meta/` – repository information

See [`.dotfiles-meta/README.md`](.dotfiles-meta/README.md) for the original list of managed tools and additional context.
