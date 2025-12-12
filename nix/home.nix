{ config, pkgs, ... }:

{
  home.username = "ieg";
  home.homeDirectory = "/home/ieg";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    bat
    bolt-launcher
    bluez
    bluez-tools
    chromium
    clang
    cmake
    diskus
    evince
    fd
    feh
    ffmpeg
    file
    font-awesome
    gnumake
    htop
    hugo
    imagemagick
    maim
    ncdu
    neofetch
    nerd-fonts.symbols-only
    ninja
    nodejs_24
    pamixer
    pass
    pavucontrol
    python312
    qemu_kvm
    qemu-utils
    remmina
    ripgrep
    rustup
    tree
    unzip
    uv
    xdotool
    xorg.xwininfo

    (import ./apps/colorbot.nix { inherit pkgs; })
  ];

  fonts.fontconfig.enable = true;

  imports = [
    ./apps/alacritty.nix
    ./apps/fish.nix
    ./apps/gdb.nix
    ./apps/git.nix
    ./apps/i3.nix
    ./apps/i3status-rust.nix
    ./apps/neovim.nix
    ./apps/tmux.nix
    ./apps/wallpapers.nix

    ./fonts/berkeley-mono.nix

    ./systemd/vnc-server.nix
    ./systemd/osrs-colorbot.nix
    ./systemd/osrs-colorbot.timer.nix
    ./systemd/osrs-reset-client.nix
    ./systemd/osrs-reset-client.timer.nix
  ];
}

