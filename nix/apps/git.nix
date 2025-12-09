{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    
    signing = {
      key = "7714EAED772DC391";
      signByDefault = true;
    };
    
    settings = {
      user.name = "ivan-guerra";
      user.email = "ivan.eduardo.guerra@gmail.com";
    
      core = {
        editor = "nvim";
      };
      init = {
        defaultBranch = "master";
      };
      credential = {
        helper = "store";
      };
    };
  };
}
