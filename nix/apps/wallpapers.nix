{ config, pkgs, ... }: 

let
  dotfiles = pkgs.fetchFromGitHub {
    owner = "ivan-guerra";
    repo = "dotfiles";
    rev = "nixos";
    sha256 = "sha256-FrVsQKTU9rCLTaQP9mL4YHxAXUMPdo43uPESqCS+B+I=";
  };
in
{
  home.file.".background-image".source = "${dotfiles}/wallpapers/sparks.jpg";
}
