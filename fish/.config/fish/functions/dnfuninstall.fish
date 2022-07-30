function dnfuninstall -d "Remove the specified package(s), its configuration(s) and unneeded dependencies"
    sudo dnf autoremove $argv
end
