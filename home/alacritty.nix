{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    theme = "ashes_dark";
    settings = {
      font = {
        normal.family = "JetBrainsMono Nerd Font";
        size = 9;
        offset.y = 1;
      };

      window = {
        padding.x = 18;
        padding.y = 18;
        dynamic_padding = true;
      };

      cursor.style = {
        shape = "Underline";
        blinking = "On";
      };
    };
  };
}
