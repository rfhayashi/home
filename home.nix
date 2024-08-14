{ config, pkgs, ... }:

let
  username = "rfhayashi";
  homeDir = "/home/" + username;
  gcap = pkgs.callPackage ./gcap.nix { };
in
{
  home.username = username;
  home.homeDirectory = homeDir;

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
  programs.gh.enable = true;

  programs.git = {
    enable = true;
    userName = "Rui Fernando Hayashi";
    userEmail = "rfhayashi@gmail.com";
    signing = {
      signByDefault = true;
      key = "rfhayashi@gmail.com";
    };
  };

  home.packages = with pkgs; [
    direnv
    devenv
    emacs
    chemacs2
    megacmd
    gcap
    discord
  ];

  home.file.".bashrc".source = ./bashrc;

  home.file.".emacs.d".source = pkgs.chemacs2 + "/share/site-lisp/chemacs2";

  home.file.".emacs-profiles.el".text = ''
    (("default" . ((user-emacs-directory . "${homeDir}/dev/emacs.d")
                   (straight-p . t))))
  '';

  home.file.".megaCmd/excluded".text = ''
    Thumbs.db
    desktop.ini
    ~.*
  '';

  home.file.".clojure/injections".source = ./clojure/injections;

  home.file.".clojure/deps.edn".text = ''
  {
    :aliases {:user {:extra-deps {global/user {:local/root "${homeDir}/.clojure/injections"}}}}
  }
  '';
}
