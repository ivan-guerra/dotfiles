{ config, pkgs, ... }:

{
  systemd.user.timers."osrs-colorbot@" = {
    Unit = {
      Description = "Run OSRS colorbot at 7AM daily (8:15AM on Wednesdays)";
    };

    Timer = {
      OnCalendar = [
        "Mon,Tue,Thu,Fri,Sat,Sun *-*-* 07:00:00"
        "Wed *-*-* 08:15:00"
      ];
    };
  };
}
