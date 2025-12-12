{ config, pkgs, ...}:

{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;
    config = {
      modifier = "Mod4";
      
      fonts = {
        names = [ "Berkeley Mono"];
        size = 11.0;
      };
      
      # Use Mouse+$super to drag floating windows to their wanted position. 
      floating.modifier = "Mod4";
      
      keybindings = let
        mod = config.xsession.windowManager.i3.config.modifier;
        alt = "Mod1";
      in {
        # Machine state controls
        "${mod}+F4" = "exec ${pkgs.systemd}/bin/systemctl poweroff";
        "${mod}+F5" = "exec ${pkgs.systemd}/bin/systemctl reboot";
        "${mod}+F6" = "exec ${pkgs.systemd}/bin/systemctl suspend -i";
        
        # Common apps keybinds
        "${mod}+d" = "exec ${pkgs.dmenu}/bin/dmenu_run";
        "${mod}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
        "${mod}+z" = "exec ${pkgs.i3lock}/bin/i3lock";
        # See https://stackoverflow.com/questions/67459316/enabling-chromium-to-sync-with-google-account for details on the oauth2 args.
        "${mod}+b" = "exec ${pkgs.chromium}/bin/chromium --oauth2-client-id=77185425430. apps.googleusercontent.com --oauth2-client-secret=OTJgUOQcT7lO7GsGZq2G4IlT";
        
        # Change volume
        "${mod}+${alt}+Up" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "${mod}+${alt}+Down" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        
        # Change brightness
        "${mod}+${alt}+Left" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%-";
        "${mod}+${alt}+Right" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set +5%";
        
        # Start/stop screen recording
        "${mod}+${alt}+r" = "exec ${pkgs.ffmpeg}/bin/ffmpeg -y -f x11grab -draw_mouse 0 -s 1920x1080 -i :0 $HOME/downloads/recording.mp4";
        "${mod}+${alt}+e" = "exec ${pkgs.procps}/bin/pkill ffmpeg";
        
        # Kill focused window
        "${mod}+c" = "kill";
        
        # Change focus
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        
        # Move focused window
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";
        
        # Split orientation
        "${mod}+h+s" = "split h";
        "${mod}+v+s" = "split v";
        
        # Fullscreen
        "${mod}+f" = "fullscreen toggle";
        
        # Container layout
        "${mod}+s" = "layout toggle split";
        
        # Floating
        "${mod}+space" = "floating toggle";
        "${mod}+Shift+space" = "focus mode_toggle";
        
        # Switch workspace
        "${mod}+1" = "workspace 1";
        "${mod}+2" = "workspace 2";
        "${mod}+3" = "workspace 3";
        "${mod}+4" = "workspace 4";
        "${mod}+5" = "workspace 5";
        
        # Move to workspace
        "${mod}+Shift+1" = "move container to workspace 1";
        "${mod}+Shift+2" = "move container to workspace 2";
        "${mod}+Shift+3" = "move container to workspace 3";
        "${mod}+Shift+4" = "move container to workspace 4";
        "${mod}+Shift+5" = "move container to workspace 5";
        
        # Restart/exit i3
        "${mod}+Shift+r" = "restart";
        "${mod}+q" = "exit";
        
        # Resize mode
        "${mod}+r" = "mode resize";
      };
      
      modes = {
        resize = {
          "Left" = "resize shrink width 5 px or 5 ppt";
          "Down" = "resize grow height 5 px or 5 ppt";
          "Up" = "resize shrink height 5 px or 5 ppt";
          "Right" = "resize grow width 5 px or 5 ppt";
          "Return" = "mode default";
        };
      };
      
      bars = [
        {
          fonts = {
            names = [ "Berkeley Mono" "FontAwesome" ];
            size = 11.0;
          };

          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-default.toml";

          colors = {
            background = "#1C1B19";
            statusline = "#2f343f";
            separator = "#4b5262";
            
            focusedWorkspace = {
              border = "#2f343f";
              background = "#000000";
              text = "#d8dee8";
            };
            
            activeWorkspace = {
              border = "#2f343f";
              background = "#2f343f";
              text = "#d8dee8";
            };
            
            inactiveWorkspace = {
              border = "#2f343f";
              background = "#2f343f";
              text = "#d8dee8";
            };
            
            urgentWorkspace = {
              border = "#2f343f";
              background = "#ebcb8b";
              text = "#2f343f";
            };
          };
        }
      ];
      
      window = {
        border = 1;
        titlebar = false;
        
        commands = [
          {
            criteria = { class = "feh"; };
            command = "floating enable";
          }
          {
            criteria = { class = "Alacritty"; };
            command = "focus";
          }
        ];
      };
      
      colors = {
        focused = {
          border = "#bf616a";
          background = "#2f343f";
          text = "#d8dee8";
          indicator = "#bf616a";
          childBorder = "#d8dee8";
        };
        focusedInactive = {
          border = "#2f343f";
          background = "#2f343f";
          text = "#d8dee8";
          indicator = "#2f343f";
          childBorder = "#2f343f";
        };
        unfocused = {
          border = "#2f343f";
          background = "#2f343f";
          text = "#d8dee8";
          indicator = "#2f343f";
          childBorder = "#2f343f";
        };
        urgent = {
          border = "#2f343f";
          background = "#2f343f";
          text = "#d8dee8";
          indicator = "#2f343f";
          childBorder = "#2f343f";
        };
        placeholder = {
          border = "#2f343f";
          background = "#2f343f";
          text = "#d8dee8";
          indicator = "#2f343f";
          childBorder = "#2f343f";
        };
        background = "#2f343f";
      };
    };
  };
  
  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
    shadow = true;
    shadowOpacity = 0.7;
    fade = true;
    fadeSteps = [ 0.03 0.03 ];
  };
}
