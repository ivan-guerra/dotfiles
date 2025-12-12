{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    
    settings = {
      terminal.shell = {
        program = "${pkgs.fish}/bin/fish";
        args = [ "-c" "tmux" ];
      };
      
      font = {
        size = 14.0;
        
        normal = {
          family = "BerkeleyMono Nerd Font";
          style = "SemiBold";
        };
        
        bold = {
          family = "BerkeleyMono Nerd Font";
          style = "Bold";
        };
        
        italic = {
          family = "BerkeleyMono Nerd Font";
          style = "SemiBold Oblique";
        };
        
        bold_italic = {
          family = "BerkeleyMono Nerd Font";
          style = "Bold Oblique";
        };
      };
      
      # Github Dark Tritanopia Colors
      colors = {
        primary = {
          background = "#0d1117";
          foreground = "#c9d1d9";
        };
        
        cursor = {
          text = "#0d1117";
          cursor = "#c9d1d9";
        };
        
        normal = {
          black = "#484f58";
          red = "#ff7b72";
          green = "#58a6ff";
          yellow = "#d29922";
          blue = "#58a6ff";
          magenta = "#bc8cff";
          cyan = "#39c5cf";
          white = "#b1bac4";
        };
        
        bright = {
          black = "#6e7681";
          red = "#ffa198";
          green = "#79c0ff";
          yellow = "#e3b341";
          blue = "#79c0ff";
          magenta = "#bc8cff";
          cyan = "#39c5cf";
          white = "#b1bac4";
        };
      };
    };
  };
} 
