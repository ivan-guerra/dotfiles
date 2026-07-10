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
        # Have to specify aj-desktop IP since pihole DNS does not resolve it
        # for some reason.
        Hostname = "10.0.0.246";
        User = "aldur07";
        port = 54448;
        identityFile = "/home/ieg/.ssh/rsbot";
      };
    };
  };
}
