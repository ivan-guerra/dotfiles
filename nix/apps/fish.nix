{ config, pkgs, lib, ...  }:

{
  programs.fish = {
    enable = true;
    
    plugins = [ 
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "fisher";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "fisher";
          rev = "4.4.5";
          hash = "sha256-VC8LMjwIvF6oG8ZVtFQvo2mGdyAzQyluAGBoK8N2/QM=";
        };
      }
    ];
    
    interactiveShellInit = ''
      # Disable greeting
      set fish_greeting
    '';
    
    loginShellInit = ''
      # Set environment variables on login
      set -x EDITOR nvim
      set -x VISUAL nvim
    '';
    
    shellAliases = {
      l = "ls --color=auto -lah";
      ".." = "cd ..";
      ".2" = "cd ../..";
      ".3" = "cd ../../..";
      dev = "cd $HOME/dev";
      ddir = "cd $HOME/downloads";
      nrs = "sudo nixos-rebuild switch";
      xcopy = "${pkgs.xclip}/bin/xclip -r -selection clipboard";
      setmon = "${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-1 --primary --auto --right-of eDP-1 --output eDP-1 --off";
      resetmon = "${pkgs.xorg.xrandr}/bin/xrandr --auto";
    };
 };
}
