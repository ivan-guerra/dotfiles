function setmon -d "Project the laptop's display to the monitor connected over HDMI"
    # Project the laptop's display to the monitor connected over HDMI. Disable
    # the laptop's display.
    xrandr --output HDMI1 --primary --auto --right-of LVDS1 --output LVDS1 --off
end
