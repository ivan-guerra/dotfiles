{ config, pkgs, ... }:

{
  systemd.user.services."osrs-setup-client@" = {
    Unit = {
      Description = "Setup Old School RuneScape client on display %i";
      After = [ "vnc-server@%i.service" ];
      Requires = [ "vnc-server@%i.service" ];
    };

    Service = {
      Type = "oneshot";
      # This is a hack to ensure that systemd doesn't kill the client when
      # rstart.sh exits
      KillMode = "none";
      Environment = "DISPLAY=:%i";
      ExecStart = "/home/ieg/dev/colorbot/rstart.sh";
    };
  };
}
