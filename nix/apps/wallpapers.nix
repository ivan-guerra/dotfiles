{ config, pkgs, ... }: 

let
  dotfiles = pkgs.fetchFromGitHub {
    owner = "ivan-guerra";
    repo = "dotfiles";
    rev = "nixos";
    sha256 = "sha256-SEOKRXv8NnyT+kXwnd7Y53Hsek27+gkTcvn7QFUfEno=";
  };
in
{
  home.file.".background-image".source = "${dotfiles}/wallpapers/sparks.jpg";
}
