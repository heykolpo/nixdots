{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "heykolpo";
    userEmail = "heykolpo@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
    aliases = {
      pu = "push";
      co = "checkout";
      cm = "commit";
    };
  };
}
