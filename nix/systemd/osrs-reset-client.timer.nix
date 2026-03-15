{ config, pkgs, ... }:

{
  systemd.user.timers.osrs-reset-client = {
    Unit = {
      Description = "Reset OSRS client at 8AM on Wednesdays";
    };

    Timer = {
      OnCalendar = [ "Wed *-*-* 08:00:00" ];
    };
  };
}
