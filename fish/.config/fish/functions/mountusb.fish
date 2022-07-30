function mountusb -d "Mount a USB to /mnt/usb"
    set expected_argc 1
    set actual_argc (count $argv)
    if test $actual_argc -ne $expected_argc
        echo "error, mountusb requires $expected_argc arguments only $actual_argc given."
        echo "usage: mountusb DEVICE_NAME"
        echo "Mount a USB device to /mnt/usb."
        echo -e "\tDEVICE_NAME\n\t\tDevice name (e.g., /dev/sdb)."
    else
        sudo mount -o gid=ieg,fmask=113,dmask=002 $argv /mnt/usb
    end
end
