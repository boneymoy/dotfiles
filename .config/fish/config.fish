alias nvim="/opt/nvim.appimage"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
set fish_greeting
