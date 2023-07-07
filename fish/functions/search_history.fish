function search_history
  set values (history | fzf --prompt=' Search history  ' --height=50% --layout=reverse --border)

  if test -z $values
    echo "Nothing selected"
    commandline -f execute
  end

  commandline $values
  commandline -f repaint
end
