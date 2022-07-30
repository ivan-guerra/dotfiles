function rku -d "Have rkhunter update its database"
    # WARNING, only run rku AFTER a successful run of rkh else you may tell
    # rkhunter to trust malicious files.
    sudo rkhunter --propupd
end
