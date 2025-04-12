# ~/.zshrc
# Loaded for each interactive shell — set up aliases, prompts, tools here

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Prompt (optional: use Starship or powerlevel10k if installed)
export PROMPT='%F{green}%n@%m %F{blue}%~ %f%% '

#Add Doom Emacs to PATH
export PATH="/Applications/MacPorts/Emacs.app/Contents/MacOS:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

# Enable basic completion and keybindings
autoload -Uz compinit
compinit
bindkey -e

# Aliases
alias ll="ls -lAh"
alias gs="git status"
alias syncnotes="~/notes/sync-notes.zsh"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias uni="cd ~/notes/uni"
alias notes="cd ~/notes"
alias blog="cd ~/website/blog"
alias peragenda='emacs ~/notes/personal/agenda.org'
alias unagenda='emacs ~/notes/uni/SS25/agenda.org'



# Path additions (if needed)
export PATH="$HOME/bin:$PATH"

# Enable LS colors (optional, depending on your theme)
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Optional: load other configs/tools
# source ~/.aliases
# source ~/.fzf.zsh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
