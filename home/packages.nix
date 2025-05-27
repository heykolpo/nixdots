{inputs, config, pkgs, ... }:

{
  programs.zen-browser = {
    enable = true;
  };

  home.packages = with pkgs; [
    hyprpaper
    inputs.ags.packages.${pkgs.system}.io
  ];
}
