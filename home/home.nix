{ config, pkgs, lib, outputs, ... }:

{


  home.username = "kolpo";
  home.homeDirectory = "/home/kolpo";
  home.stateVersion = "24.05";

  home.sessionVariables = {
    EDITOR = "nvim";
  };
 
 imports = [ ./default.nix ];

  programs.home-manager.enable = true;
}
