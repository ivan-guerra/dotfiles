{ config, pkgs, ... }:

{
  home.username = "ieg";
  home.homeDirectory = "/home/ieg";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    bat
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
    htop
    file
    font-awesome
    freerdp
    gnumake
    hugo
    imagemagick
    maim
    ncdu
    neofetch
    nerd-fonts.symbols-only
    ninja
    nodejs_24
    pass
    pamixer
    pavucontrol
    python312
    remmina
    ripgrep
    rustup
    stow
    tigervnc
    tree
    unzip
    uv
    xclip
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
  ];
}

