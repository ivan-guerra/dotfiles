{ pkgs ? import <nixpkgs> {} }:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "colorbot";
  version = "0.1.0";

  src = pkgs.fetchFromGitHub {
    owner = "ivan-guerra";
    repo = "colorbot";
    rev = "8a27f2cf6a965a49eb5da0e3f69f028cbdb12a55";
    sha256 = "sha256-QMwBbPOPcqZ0/WRb7nsK0Dh/aU6xSY/A4XaB2bDOWWY=";
  };

  cargoHash = "sha256-U5BH9rcDn8s5hfITP2K8KACssc3mVq8a/vQ6nn8YdVE=";

  nativeBuildInputs = [ pkgs.pkg-config ];

  buildInputs = with pkgs; [
    xorg.libX11
    xorg.libxcb
    xorg.xcbutil
    xorg.xcbutilimage
  ];

  meta = with pkgs.lib; {
    description = "A OSRS color bot";
    homepage = "https://github.com/ivan-guerra/colorbot";
    license = licenses.unlicense;
    platforms = platforms.linux;
    maintainers = with maintainers; [ ivan-guerra ];
  };
}
