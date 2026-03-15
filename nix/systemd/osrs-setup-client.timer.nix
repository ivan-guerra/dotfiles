{ config, pkgs, ... }:

{
  # Timer for display :1 - starts at 8:00
  systemd.user.timers."osrs-setup-client@1" = {
    Unit.Description = "Setup OSRS client at 8:00 AM on Wednesdays for display :1";
    Timer = {
      OnCalendar = [ "Wed *-*-* 08:00:00" ];
    };
  };

  # Timer for display :2 - starts at 8:01
  systemd.user.timers."osrs-setup-client@2" = {
    Unit.Description = "Setup OSRS client at 8:01 AM on Wednesdays for display :2";
    Timer = {
      OnCalendar = [ "Wed *-*-* 08:01:00" ];
    };
  };
}
