{ config, pkgs, lib, ... }:

{
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 14;
  };

  gtk = {
    enable = true;

    theme = {
        package = pkgs.adw-gtk3;
        name = "adw-gtk3-dark";
    };

    iconTheme = {
        package = pkgs.adwaita-icon-theme;
        name = "Adwaita";
    };

    font = {
        name = "Adwaita Sans";
        size = 10;
    };
  };

}
