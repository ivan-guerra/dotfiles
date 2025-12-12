{ config, pkgs, ... }:

let
  berkeleyMono = pkgs.stdenvNoCC.mkDerivation {
    pname = "berkeley-mono";
    version = "1.0.0";
    
    src = pkgs.fetchFromGitHub {
      owner = "ivan-guerra";
      repo = "dotfiles";
      rev = "nixos";
      sha256 = "sha256-SEOKRXv8NnyT+kXwnd7Y53Hsek27+gkTcvn7QFUfEno=";
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
