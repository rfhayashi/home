{ config, pkgs, ...}:

{
  home.username = "rfhayashi";
  home.homeDirectory = "/home/rfhayashi";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    devenv
    emacs
  ];
}
