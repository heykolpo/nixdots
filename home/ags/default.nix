{ config, pkgs, inputs, ... }:

{

  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    configDir = ../ags;

    extraPackages = with pkgs; [
      inputs.ags.packages.${pkgs.system}.battery
      inputs.ags.packages.${pkgs.system}.hyprland
      inputs.ags.packages.${pkgs.system}.wireplumber
      nerd-fonts.jetbrains-mono
      karla
    ];
  };

  # home.file = {
  #   ".config/ags" = {
  #     source = ../ags;
  #     recursive = true;
  #   };
  # };
}
