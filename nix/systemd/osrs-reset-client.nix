{ config, pkgs, ... }:

{
  systemd.user.services.osrs-reset-client = {
    Unit = {
      Description = "Reset Old School RuneScape client";
      After = [ "vnc-server.service" ];
      Requires = [ "vnc-server.service" ];
    };

    Service = {
      Type = "oneshot";
      Environment = "DISPLAY=:1";
      ExecStart = "${pkgs.bash}/bin/bash /home/ieg/dev/colorbot/rstart.sh";
    };
  };
}
