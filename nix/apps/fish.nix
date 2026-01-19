{ config, pkgs, lib, ...  }:

let
  dotfiles = pkgs.fetchFromGitHub {
    owner = "ivan-guerra";
    repo = "dotfiles";
    rev = "nixos";
    sha256 = "sha256-WqQNqoDks1qHEpvYLuVJxNZLJZvuWgsGs2iHOjIP3Fg=";
  };
in
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
      set -x MANPAGER "sh -c 'sed -u -e \"s/\\x1B\\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -l man'"
      set -x MANROFFOPT "-c"
    '';

    shellInit = ''
      set -gx GPG_TTY (tty)
    '';
    
    shellAliases = {
      l = "ls --color=auto -lah";
      ".." = "cd ..";
      ".2" = "cd ../..";
      ".3" = "cd ../../..";
      vi = "${pkgs.neovim}/bin/nvim";
      vim = "${pkgs.neovim}/bin/nvim";
      dev = "cd $HOME/dev";
      ddir = "cd $HOME/downloads";
      nrs = "sudo nixos-rebuild switch";
      xcopy = "${pkgs.xclip}/bin/xclip -r -selection clipboard";
      setmon = "${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-1 --primary --auto --right-of eDP-1 --output eDP-1 --off";
      resetmon = "${pkgs.xorg.xrandr}/bin/xrandr --auto";
    };

    functions.fish_prompt = ''
      set -l last_pipestatus $pipestatus
      set -lx __fish_last_status $status # Export for __fish_print_pipestatus.

      if not set -q __fish_git_prompt_color_branch
          set -g __fish_git_prompt_color_branch brgreen --bold
      end

      set -l color_cwd
      set -l suffix
      if functions -q fish_is_root_user; and fish_is_root_user
          if set -q fish_color_cwd_root
              set color_cwd $fish_color_cwd_root
          else
              set color_cwd $fish_color_cwd
          end
          set suffix '#'
      else
          set color_cwd cyan
          set suffix '::'
      end

      # PWD
      set_color $color_cwd
      echo -n (prompt_pwd)
      set_color normal

      printf '%s ' (fish_vcs_prompt)

      set -l status_color (set_color $fish_color_status)
      set -l statusb_color (set_color --bold $fish_color_status)
      set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)
      echo -n $prompt_status
      set_color normal

      echo -n "$suffix "
      '';
    };

    xdg.configFile."fish/completions/pass.fish".source = "${dotfiles}/fish/completions/pass.fish";
}
