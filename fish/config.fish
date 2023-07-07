if status is-interactive
  # Theme config
  set -U budspencer_nogreeting
  set -U budspencer_nobell

  set -gx PATH bin $PATH
  set -gx PATH ~/bin $PATH   
  set -gx PATH ~/.local/bin $PATH
  set -gx PATH ~/.cargo/bin $PATH
  
  # NodeJS
  set -gx PATH node_modules/.bin $PATH

  # asdf
  source ~/.asdf/asdf.fish

  # Commands to run in interactive sessions can go here
  . ~/.config/z/z.fish
  z --add "$PWD"

  # Aliases
  alias ll "exa -l -g --icons"
  alias .. "cd .."
  alias vi "nvim"
  alias vim "nvim"
  alias astro-nvim="NVIM_APPNAME=AstroNvim nvim"

end
