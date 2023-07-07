function astro-nvim
  env NVIM_APPNAME=AstroNvim nvim $argv
end

function select_nvim_config
  set -l items "default" "AstroNvim"
  set config (printf "%s\n" $items | fzf --prompt=" Neovim Config  " --height=50% --layout=reverse --border)
    
  if test -z $config
    echo "Nothing selected"
    commandline -f execute
    return
  else if test $config = "default"
    set config ""
  end
  
  env NVIM_APPNAME=$config nvim $argv
  commandline -f execute
end
