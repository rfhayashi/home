{ config, pkgs, ...}:

{
  home.username = "rfhayashi";
  home.homeDirectory = "/home/rfhayashi";

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    emacs
    devenv
  ];
}
