{ config, pkgs, ... }:

{
  systemd.user.services.osrs-colorbot = {
    Unit = {
      Description = "Launch Old School RuneScape colorbot";
      After = [ "vnc-server.service" ];
      Requires = [ "vnc-server.service" ];
    };
    
    Service = {
      Type = "simple";
      Environment = "DISPLAY=:1";
      ExecStart = "${pkgs.bash}/bin/bash /home/ieg/dev/colorbot/money_bot.sh";
    };
  };
}
