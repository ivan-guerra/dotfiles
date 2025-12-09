{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    
    shell = "${pkgs.fish}/bin/fish";
 
    # Reduce default delay
    escapeTime = 1;
 
    baseIndex = 1;

    mouse = true;

    # Custom leader key
    prefix = "C-f";

    terminal = "tmux-256color";
    
    # Catppuccin theme plugin
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "mocha"
          set -g @catppuccin_window_status_style "slanted"
          set -g @catppuccin_window_text "#W"
          set -g @catppuccin_window_current_text "#W"
        '';
      }
    ];
    
    extraConfig = ''
      # Automatically renumber window indices
      set -g renumber-windows on

      # Split panes
      bind | split-window -h
      bind _ split-window -v
      
      # vim-like navigation/operations
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      set -g mode-keys vi
      bind P paste-buffer
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel "${pkgs.xclip}/bin/xclip -i -sel c"
      
      # Status line configuration
      set -g status-right-length 100
      set -g status-left-length 100
      set -g status-left ""
      set -g status-right ""
    '';
  };
}
