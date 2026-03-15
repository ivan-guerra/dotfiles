{ config, pkgs, ... }:

{
  systemd.user.services.vnc-server = {
    Unit = {
      Description = "VNC Server with Xvfb and i3";
      After = [ "graphical-session.target" ];
    };
    
    Service = {
      Type = "simple";
      
      ExecStartPre = "${pkgs.writeShellScript "vnc-cleanup" ''
        ${pkgs.procps}/bin/pkill -f "Xvfb :1" || true
        ${pkgs.procps}/bin/pkill -f "x11vnc.*:1" || true
        ${pkgs.coreutils}/bin/rm -f /tmp/.X1-lock 2>/dev/null || true
      ''}";
      
      ExecStart = "${pkgs.writeShellScript "vnc-start" ''
        set -e
        export PATH=${pkgs.coreutils}/bin:${pkgs.procps}/bin:${pkgs.gnugrep}/bin:${pkgs.gawk}/bin:${pkgs.gnused}/bin:${pkgs.nettools}/bin:$PATH
        export DISPLAY=:1
        
        mkdir -p ~/.vnc
        
        # The dimensions were tuned so that they would work well with the OSRS
        # color bot which is the main program which runs in the virt display.
        ${pkgs.xorg.xorgserver}/bin/Xvfb :1 -screen 0 1918x1053x24 &
        echo $!  > ~/.vnc/Xvfb.pid
        sleep 3
        
        ${pkgs.i3}/bin/i3 &
        echo $! > ~/.vnc/i3.pid
        sleep 2
        
        exec ${pkgs.x11vnc}/bin/x11vnc -display :1 -rfbport 5901 -forever -shared -noxdamage -listen localhost -cursor arrow -nocursorshape
      ''}";
      
      ExecStop = "${pkgs.writeShellScript "vnc-stop" ''
        [ -f ~/.vnc/i3.pid ] && kill $(cat ~/.vnc/i3.pid) 2>/dev/null || true
        [ -f ~/.vnc/Xvfb.pid ] && kill $(cat ~/.vnc/Xvfb.pid) 2>/dev/null || true
        ${pkgs.procps}/bin/pkill -f "Xvfb :1" || true
        ${pkgs.procps}/bin/pkill -f "x11vnc.*:1" || true
        rm -f /tmp/.X1-lock ~/.vnc/*.pid 2>/dev/null || true
      ''}";
    };
  };

  home.packages = with pkgs; [
    tigervnc
  ];
}
