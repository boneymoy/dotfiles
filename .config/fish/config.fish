alias nvim='/usr/bin/nvim.appimage'
alias l='exa'
alias ls='exa'
alias ll='exa --long --git --header'
alias la='exa -a --long --git --header'
alias bat='bat --theme gruvbox-dark'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
