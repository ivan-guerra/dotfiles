function fish_title -d "Set a custom terminal title"
    set argv $USER@$hostname
    echo $argv:(fish_prompt_pwd_dir_length=0 prompt_pwd);
end
