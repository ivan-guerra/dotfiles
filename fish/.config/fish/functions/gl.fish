function gl -d "Git log with reverse stat"
  set argc (count $argv)
  if test $argc -eq 0
    git log --stat
  else
    git log --stat -n $argv
  end
end
