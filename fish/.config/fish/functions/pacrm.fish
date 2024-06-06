function pacrm -d "Remove the specified package(s), its configuration(s) and unneeded dependencies"
    sudo pacman -Rsc $argv
end
