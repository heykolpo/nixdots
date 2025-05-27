{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
        preload = [ "/home/kolpo/Pictures/background" ];
        wallpaper = [ ", /home/kolpo/Pictures/background" ];
    };
  };
}
