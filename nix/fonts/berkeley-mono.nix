{ config, pkgs, ... }:

let
  berkeleyMono = pkgs.stdenvNoCC.mkDerivation {
    pname = "berkeley-mono";
    version = "1.0.0";
    
    src = pkgs.fetchFromGitHub {
      owner = "ivan-guerra";
      repo = "dotfiles";
      rev = "nixos";
      sha256 = "sha256-WqQNqoDks1qHEpvYLuVJxNZLJZvuWgsGs2iHOjIP3Fg=";
    };
    
    installPhase = ''
      mkdir -p $out/share/fonts/truetype
      find ./fonts/TX-02-KNRV24YN -type f -name "*.ttf" -exec cp {} $out/share/fonts/truetype/ \;
    '';
  };
in
{
  home.packages = [ berkeleyMono ];
  fonts.fontconfig.enable = true;
}
