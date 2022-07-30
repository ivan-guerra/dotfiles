function setmon -d "Project the laptop's display to the monitor connected over HDMI"
    # Project the laptop's display to the monitor connected over HDMI. Disable
    # the laptop's display.
    xrandr --output HDMI-1 --primary --auto --right-of eDP-1 --output eDP-1 --off
end
