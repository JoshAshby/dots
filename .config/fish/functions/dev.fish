function dev
  if test -n "$argv"
    cd ~/Developer/$argv
  else
    cd ~/Developer/
  end
end
