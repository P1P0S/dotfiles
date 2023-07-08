function fzf_directory_global
  set -l selected_file ( find $HOME -type d \( -name "node_modules" -o -name ".git" \) -prune -o -type d -print | fzf --prompt=" Change global directory  " --height=50% --layout=reverse --border --exact)
  if test "$selected_file"
    cd $selected_file
    commandline -f execute
  end
  commandline -f repaint
end
