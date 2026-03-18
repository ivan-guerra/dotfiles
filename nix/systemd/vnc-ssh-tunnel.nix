{ config, pkgs, ... }:

{
  systemd.user.services.vnc-ssh-tunnel = {
    Unit = {
      Description = "SSH Tunnel for Dreambot VM VNC";
    };
    
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.openssh}/bin/ssh -N -L 5900:localhost:5900 aldur07@localhost -p 2222";
    };
  };
}
