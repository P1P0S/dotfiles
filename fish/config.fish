if status is-interactive
end

starship init fish | source

set fish_greeting
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH   
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.cargo/bin $PATH
set -Ux PATH $HOME/.asdf/shims $PATH

#asdf
source ~/.asdf/asdf.fish
set -gx PATH ~/.asdf/shims $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Aliases
alias ll "lsd -la"
alias ls "lsd"
alias .. "cd .."
alias vi "nvim"
alias vim "nvim"
alias neo "neovide.exe"
alias cc "npm cache clean --force && yarn cache clean && pnpm store prune && rm -rf ~/.bun/install/cache/*"
alias open="explorer.exe"

zoxide init fish | source
