function fzf_directory_local
  set -l files (find . -type d)
  if test (count $files) -eq 1
    echo "Does not have directories"
    commandline -f execute
  else
    set -l selected_file (find . -type d \( -name "node_modules" -o -name ".git" \) -prune -o -type d -print | fzf --prompt=" Change local directory  " --height=50% --layout=reverse --border)
    if test -n "$selected_file"
      cd $selected_file
    end
    commandline -f repaint
  end
end
