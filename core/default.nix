{ config, pkgs, lib, inputs, ... }:

{

  imports = [
    # inputs.zen-browser.homeModules.beta
    # inputs.ags.homeManagerModules.default
    # inputs.nix4nvchad.homeManagerModules.default
    ./boot.nix
    ./fonts.nix
    ./hardware.nix
    ./network.nix
    ./packages.nix
    ./security.nix
    ./services.nix
    ./ssh.nix
    ./system.nix
    ./users.nix
    ./xserver.nix
  ];
}
