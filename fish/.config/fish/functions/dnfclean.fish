function dnfclean -d "Clean cache - delete all the package files in the cache"
    sudo dnf clean all
    sudo dnf autoremove
end
