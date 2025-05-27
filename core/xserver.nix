{ pkgs, ... }:

{

  services.xserver = {
    enable = true;

    xkb = {
      layout = "us";
      variant = "";
    };
   
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    desktopManager.xterm.enable = false;  

    videoDrivers = [ "mesa" "vaapi" ];
  };
}
