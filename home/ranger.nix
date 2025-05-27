{ config, pkgs, ... }:

{
  programs.ranger = {
    enable = true;
    settings = {
      show_hidden = true;
    };
  };
}
