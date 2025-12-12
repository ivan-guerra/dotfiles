{ config, pkgs, ... }:

{
  programs.i3status-rust = {
    enable = true;
    
    bars = {
      default = {
        blocks = [
          {
            block = "cpu";
            interval = 1;
            format = " $icon $utilization ";
            format_alt = " $icon $barchart $utilization ";
          }
          
          {
            block = "temperature";
            interval = 1;
            chip = "*-isa-*";
            format = " $icon $max ";
          }
          
          {
            block = "disk_space";
            path = "/";
            interval = 20;
            format = " $icon $available ";
            warning = 20.0;
            alert = 10.0;
          }
          
          {
            block = "net";
            device = "wlp1s0";
            interval = 5;
            format = " $icon {$ssid} ";
            format_alt = " $icon {$signal_strength $ssid $frequency $bitrate|Disconnected} ";
          }
          
          {
            block = "sound";
            driver = "auto";
            format = " $icon {$volume|Muted} ";
            max_vol = 100;
            step_width = 5;
          }
          
          {
            block = "battery";
            interval = 10;
            format = " $icon $percentage {$time|} ";
            device = "BAT0";
            full_format = " $icon $percentage ";
            missing_format = "";
          }
          
          {
            block = "time";
            interval = 1;
            format = " $icon $timestamp.datetime(f:'%a %-d %b %I:%M') ";
          }
        ];
        
        settings = {
          theme = {
            theme = "srcery";
          };
        };
        icons = "awesome6";
      };
    };
  };
}
