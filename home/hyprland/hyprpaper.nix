{
  config,
  pkgs,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["/home/kolpo/Pictures/solid.png"];
      wallpaper = [", /home/kolpo/Pictures/solid.png"];
    };
  };
}
