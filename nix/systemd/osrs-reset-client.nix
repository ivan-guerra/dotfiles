{ config, pkgs, ... }:

{
  systemd.user.services.osrs-reset-client = {
    Unit = {
      Description = "Reset Old School RuneScape client";
      After = [ "vnc-server.service" ];
      Requires = [ "vnc-server.service" ];
    };

    Service = {
      Type = "simple";
      # KillMode set to none means no processes spawned by the script will be killed
      # when systemd finishes executing the script. Without this option systemd will
      # reap the client itself.
      KillMode = "none";
      Environment = "DISPLAY=:1";
      ExecStart = "${pkgs.bash}/bin/bash /home/ieg/dev/colorbot/rstart.sh";
    };
  };
}
