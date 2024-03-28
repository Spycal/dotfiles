# Created by newuser for 5.9
#!/usr/bin/zsh

alias ls="eza --long"
alias lse="eza --long --tree --header --git"
alias tree="eza --tree"
alias ff="fastfetch"
alias ffe="fastfetch -c /usr/share/fastfetch/presets/btw.jsonc"
alias pl="pipes.sh"
alias cat="bat"
alias cato="bat --style=plain"

autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

export PATH="$PATH:$HOME/.cargo/bin/:$HOME/.local/share/gem/ruby/3.0.0/bin/:/usr/profile"
export EDITOR="nvim"
export TERM="xterm-256color"
export $(dbus-launch)
export MOZ_ENABLE_WAYLAND=1 
export GTK_USE_PORTAL=1
export GTK_THEME='Catppuccin-Mocha-Standard-Sapphire-Dark:dark'

if [[ $TMUX ]]; then
    echo "Zen-Mode Activated!\n"
    riverctl toggle-fullscreen
else
    ff
fi
