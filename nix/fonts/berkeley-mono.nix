{ config, pkgs, ... }:

let
  berkeleyMono = pkgs.stdenvNoCC.mkDerivation {
    pname = "berkeley-mono";
    version = "1.0.0";
    
    src = pkgs.fetchFromGitHub {
      owner = "ivan-guerra";
      repo = "dotfiles";
      rev = "master";
      sha256 = "sha256-E7Et+RQ0zNDIkt7fAAK3B6TibHaLvnpy4hZtmyQ8sgE=";
    };
    
    installPhase = ''
      mkdir -p $out/share/fonts/truetype
      find ./fonts/TX-02-JMQJQZQV -type f -name "*.ttf" -exec cp {} $out/share/fonts/truetype/ \;
    '';
  };
in
{
  home.packages = [ berkeleyMono ];
  fonts.fontconfig.enable = true;
}
