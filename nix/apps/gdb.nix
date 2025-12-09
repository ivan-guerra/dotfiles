{ config, pkgs, ... }:

{
  home.file.".gdbinit".text = ''
    set confirm off
    set debuginfod enabled off

    # avoid stepping into the std library
    skip -gfi ${pkgs.stdenv.cc.cc}/include/c++/*/*/*
    skip -gfi ${pkgs.stdenv.cc.cc}/include/c++/*/*
    skip -gfi ${pkgs.stdenv.cc.cc}/include/c++/*
  '';

  home.file.".gdbearlyinit".text = ''
    set startup-quietly on
  ''; 

  home.packages = with pkgs; [
    gdb
  ];
}
