# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set the command prompt line title to display the CWD (short form)
PS1='\w :: '

# Set the umask to NSA RHEL5 recommended
umask 077

# Restrict use of shell commands when editing in nano using <sudoedit>
export SUDO_EDITOR=vim

# Misc commands
alias ls='ls --color=auto'            # Color ls output
alias ll='ls -la'                     # Display file (including hidden files) metadata
alias pdf='evince'                    # Read PDFs using the evince PDF reader
alias rkh='sudo rkhunter -c --sk'     # Have rkhunter run a scan of the filesystem
alias rku='sudo rkhunter --propupd'   # Have rkhunter update its database
alias taggen='ctags -R *'             # Generate ctags for the CWD
alias valmem='valgrind --leak-check=yes --track-origins=yes' # Use Valgrind to check for memory leaks

# Navigation commands
alias ..='cd ..'            # cd .. (x1)
alias .2='cd ../../'        # cd .. (x2)
alias .3='cd ../../../'     # cd .. (x3)
alias dev='cd ~/dev'        # Shortcut to the development directory
alias ddir='cd ~/downloads' # Shortcut to the download directory

# Display adjustment
alias setmon='xrandr --output HDMI1 --primary --auto --right-of LVDS1 --output LVDS1 --off' # Project the laptop's display to the monitor connected over HDMI
alias resetmon='xrandr --auto' # Have xrandr set the display to the default set at boot

# Mount a USB device to /mnt/usb.
# $1 - Device name (e.g., /dev/sdb).
mountusb() {
  sudo mount -o gid=ieg,fmask=113,dmask=002 $1 /mnt/usb
}

# Unmount the filesystem at the USB mountpoint
umountusb() {
    sudo umount /mnt/usb
}

# Play a video with ffplay and include a timestamp box in HH:MM:SS format.
# $1 - Path to the movie file.
playmovie() {
  ffplay -vf "drawtext=text='%{pts\:hms}':box=1:x=(w-tw)/2:y=h-(2*lh)" $1
}

# Cut the input video from some start time to some end time.
# $1 - Input video file name with the extension included.
# $2 - Output video file name with the extension included.
# $3 - Snippet start time in HH:MM:SS format.
# $4 - Snippet end time in HH:MM:SS format.
trimmovie() {
  ffmpeg -i $1 -ss $3 -to $4 -c:v copy -c:a copy $2
}

# Activate colored manpages
man() {
    {
        env LESS_TERMCAP_mb=$'\E[01;31m' \
            LESS_TERMCAP_md=$'\E[01;38;5;74m' \
            LESS_TERMCAP_me=$'\E[0m' \
            LESS_TERMCAP_se=$'\E[0m' \
            LESS_TERMCAP_so=$'\E[38;5;246m' \
            LESS_TERMCAP_ue=$'\E[0m' \
            LESS_TERMCAP_us=$'\E[04;38;5;146m' \
            man "$@"
    }
}
