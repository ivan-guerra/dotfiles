{ config, pkgs, ... }: 

let
  dotfiles = pkgs.fetchFromGitHub {
    owner = "ivan-guerra";
    repo = "dotfiles";
    rev = "nixos";
    sha256 = "sha256-TtSVXKj/lxdL+vQCS2HQsmjKzW3AMuREBJUWe/xWoLQ=";
  };
in
{
  home.file.".background-image".source = "${dotfiles}/wallpapers/jupiter.png";
}
