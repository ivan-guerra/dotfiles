{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "*" = {
        ForwardAgent = false;
        ServerAliveInterval = 60;
        ControlMaster = "auto";
        ControlPersist = "10m";
      };

      "pihole" = {
        Hostname = "pihole";
        User = "db";
        identityFile = "/home/ieg/.ssh/pihole";
      };

      "antikles" = {
        Hostname = "prim";
        User = "rsbot";
        port = 2222;
        identityFile = "/home/ieg/.ssh/rsbot";
      };

      "telekrates" = {
        Hostname = "aj-desktop";
        User = "rsbot";
        port = 54448;
        identityFile = "/home/ieg/.ssh/rsbot";
      };
    };
  };
}
