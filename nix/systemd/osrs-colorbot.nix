{ config, pkgs, ... }:

{
  systemd.user.services."osrs-colorbot@" = {
    Unit = {
      Description = "Launch Old School RuneScape Colorbot on display %i";
      After = [ "vnc-server@%i.service" ];
      Requires = [ "vnc-server@%i.service" ];
    };
    
    Service = {
      Type = "simple";
      Environment = "DISPLAY=:%i";
      ExecStart = "${pkgs.bash}/bin/bash /home/ieg/dev/colorbot/bot.sh";
    };
  };
}
