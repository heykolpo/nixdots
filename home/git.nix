{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "TahsanBinAlam";
    userEmail = "tahsanbinalam@gmail.com";
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
