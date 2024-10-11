function cp -d "Alias cp to rsync"
  rsync -ah --inplace --no-whole-file --info=progress2 $argv
end
