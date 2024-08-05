{ config, pkgs, ...}:

{
  home.username = "rfhayashi";
  home.homeDirectory = "/home/rfhayashi";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Rui Fernando Hayashi";
    userEmail="rfhayashi@gmail.com";
    signing = {
      signByDefault = true;
      key = "rfhayashi@gmail.com";
    };    
  };

  home.packages = with pkgs; [
    devenv
    emacs
    chemacs2
  ];

  home.file.".emacs.d".source = pkgs.chemacs2 + "/share/site-lisp/chemacs2";

  home.file.".emacs-profiles".text = ''
    (("default" . ((user-emacs-directory . "/home/rfhayashi/dev/emacs.d")
                   (straight-p . t))))
  '';
}
