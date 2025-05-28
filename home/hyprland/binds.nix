{
  config,
  pkgs,
  ...
}: let
  mainMod = "SUPER";
in {
  wayland.windowManager.hyprland.settings = {
    bind = [
      "${mainMod}, T, exec, alacritty"
      "${mainMod}, Q, killactive,"
      "${mainMod}, Escape, exit,"
      "${mainMod}, E, exec, nemo"
      "${mainMod}, V, togglefloating,"
      "${mainMod}, Space, exec, rofi -show drun"
      "${mainMod}, A, exec, rofi -show window"
      "${mainMod}, P, pseudo,"
      # "${mainMod}, J, togglesplit,"
      "${mainMod}, F, fullscreen,"
      "${mainMod}+Shift, F, fullscreen, 1"
      "${mainMod}, B, exec, zen-beta"
      "${mainMod}, S, exec, grimblast copysave area ~/Pictures/Screenshots"
      "${mainMod}, C, exec, telegram-desktop"
      "${mainMod}, W, exec, pkill js"
      "${mainMod}+Shift, W, exec, pkill js ; ags run"
      "${mainMod}, O, exec, obsidian"
      "${mainMod}, Left, movefocus, l"
      "${mainMod}, H, movefocus, l"
      "${mainMod}, Right, movefocus, r"
      "${mainMod}, L, movefocus, r"
      "${mainMod}, Up, movefocus, u"
      "${mainMod}, K, movefocus, u"
      "${mainMod}, Down, movefocus, d"
      "${mainMod}, J, movefocus, d"
      "${mainMod}, 1, workspace, 1"
      "${mainMod}, 2, workspace, 2"
      "${mainMod}, 3, workspace, 3"
      "${mainMod}, 4, workspace, 4"
      "${mainMod}, 5, workspace, 5"
      "${mainMod}, 6, workspace, 6"
      "${mainMod}, 7, workspace, 7"
      "${mainMod}, 8, workspace, 8"
      "${mainMod}, 9, workspace, 9"
      "${mainMod}, 0, workspace, 10"
      "${mainMod}+Shift, 1, movetoworkspace, 1"
      "${mainMod}+Shift, 2, movetoworkspace, 2"
      "${mainMod}+Shift, 3, movetoworkspace, 3"
      "${mainMod}+Shift, 4, movetoworkspace, 4"
      "${mainMod}+Shift, 5, movetoworkspace, 5"
      "${mainMod}+Shift, 6, movetoworkspace, 6"
      "${mainMod}+Shift, 7, movetoworkspace, 7"
      "${mainMod}+Shift, 8, movetoworkspace, 8"
      "${mainMod}+Shift, 9, movetoworkspace, 9"
      "${mainMod}+Shift, 0, movetoworkspace, 10"
      "${mainMod}, mouse_down, workspace, e+1"
      "${mainMod}, mouse_up, workspace, e-1"
    ];

    bindm = [
      "${mainMod}, mouse:272, movewindow"
      "${mainMod}, mouse:273, resizewindow"
    ];

    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
    ];
  };
}
