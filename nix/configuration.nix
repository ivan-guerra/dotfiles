{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  # Enable networking.
  networking.hostName = "prim";
  networking.networkmanager.enable = true;

  # Time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ieg = {
    isNormalUser = true;
    description = "Ivan Eduardo Guerra";
    extraGroups = [ "networkmanager" "wheel" "docker" "audio" ];
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCOei7xvSTFFzzJvb78OvCiqOxujcuM0Dc1yZQIVP0aKPwJvyZMDPg6ZCZcpgqmqcsS58wpZSIps9PxRNLb9b1oEV4QstytrOIZ7hdIbCDnAxL0tv3rhX1rTtKRvx0wOYUyVCcgJFB3IwAD6tNKEdIF2pKVBuq2YatyS1o/3/PFlFcV0Oa8j7NDDhHLwYWKEy9JqbAoQjQvKhKHARqBFlAq560Ulo8q8+guv6FyoltpfNnSkHxQp/5ljgAGySfsVebuFiOAIi2TNambLQSrvpxS1uVRXA2TrfMsf1G06be7I+nTaFi39VAUQDAh5q6x1iOpaA1g0AgPmH6qNKj9mLTYoZ+tRaRUf/5/RIR2bqqe9K/zGDWnD2Kk3hmChnjEVhg/4TWtcN4jufN1smvzR+8MPQ6Nsv1/U4aKRhVXszb9MvvX3rCbefufC+l+c9GfMZNHYlt9EamJHOj+3amvqmaJiaVTas9n/NkojFTowFa12wX3B2GIRyokNElkdlM06S8= ieg@prim"
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.ieg = import ./home.nix;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses; 
  };

  # Enable fish system-wide
  programs.fish.enable = true;

  # Enable nm-cli for network conn management
  programs.nm-applet.enable = true;

  # Enable Docker
  virtualisation.docker.enable = true;

  # Enable X and set i3 as WM
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    windowManager.i3.enable = true;
  };
  services.displayManager = {
    defaultSession = "none+i3";
  };
  security.pam.services = {
    i3lock.enable = true;
    i3lock-color.enable = true;
  }; 

  # Enable the OpenSSH daemon
  services.openssh.enable = true;
  services.openssh.ports = [ 54446 ];
  services.openssh.settings.PasswordAuthentication = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11";

  # Audio
  services.pulseaudio.enable = false; # Use Pipewire, the modern sound subsystem
  security.rtkit.enable = true; # Enable RealtimeKit for audio purposes

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Don't prompt ieg for a password when using sudo.
  security.sudo.extraRules= [
      {
        users = [ "ieg" ];
        commands = [
          { command = "ALL" ;
            options= [ "NOPASSWD" ];
          }
        ];
      }
   ];

  # Enable nix-ld to run dynamic executables
  # This is currently enabled to allow the installation of the fish-ai plugin which
  # uses python in a venv during its installation.
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
  ];
}
