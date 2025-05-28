{ config, pkgs, ... }:

{
  programs.nvchad = {
    enable = true;
  };

  home.file = {
    ".config/nvim/lua/chadrc.lua".source = ./chadrc.lua;
  };
}
