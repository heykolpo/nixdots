{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings =  {

    workspace = [
      "w[v1]s[false], gapsout:0, gapsin:0, border:false, rounding:0"
      "f[1]s[false], gapsout:0, gapsin:0, border:false, rounding:0"
    ];

    windowrule = [
      "bordersize 0, floating:0, onworkspace:w[v1]s[false]"
      "rounding 0, floating:0, onworkspace:w[v1]s[false]"
      "bordersize 0, floating:0, onworkspace:f[1]s[false]"
      "rounding 0, floating:0, onworkspace:f[1]s[false]"
    ];
  };
}
