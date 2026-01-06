{ config, pkgs, ... }: 

let
  dotfiles = pkgs.fetchFromGitHub {
    owner = "ivan-guerra";
    repo = "dotfiles";
    rev = "nixos";
    sha256 = "sha256-WqQNqoDks1qHEpvYLuVJxNZLJZvuWgsGs2iHOjIP3Fg=";
  };
in
{
  home.file.".background-image".source = "${dotfiles}/wallpapers/jupiter.png";
}
