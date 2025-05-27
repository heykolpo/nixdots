
{ config, pkgs, lib, inputs, ... }:

{

  imports = [
    inputs.zen-browser.homeModules.beta
    # inputs.ags.homeManagerModules.default
    inputs.nix4nvchad.homeManagerModules.default
    ./hyprland
    ./ags
    ./alacritty.nix
    ./git.nix
    ./gtk.nix
    ./nvchad.nix
    ./packages.nix
    ./ranger.nix
    ./syncthing.nix
    ./zsh.nix
  ];
}
