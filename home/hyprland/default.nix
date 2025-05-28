{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hyprland.nix
    ./binds.nix
    ./window-rules.nix
    ./hyprpaper.nix
  ];
}
