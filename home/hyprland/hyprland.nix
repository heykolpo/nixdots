{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    grimblast
    wl-clipboard
    hyprpolkitagent
    hyprland-qtutils
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];

  wayland.windowManager.hyprland = {
    enable = true; # enable Hyprland
    package = null;
    portalPackage = null;
    xwayland.enable = true;
    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = ["--all"];
    };

    settings = {
      monitor = [",highres,auto,1"];

      "exec-once" = [
        "hyprpaper"
        "ags run"
        "systemctl --user start hyprpolkitagent"
        "/usr/bin/kdeconnectd & disown"
        "hyprctl setcursor Bibata-Modern 20"
      ];

      general = {
        gaps_in = 4;
        gaps_out = 8;
        border_size = 2;
        "col.active_border" = "rgba(95aec7ff)";
        "col.inactive_border" = "rgba(303437ff)";
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindled";
        no_border_on_floating = false;
        hover_icon_on_border = true;
      };

      decoration = {
        rounding = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 30;
          offset = "0 4";
          render_power = 4;
          color = "rgba(00000040)";
        };

        blur = {
          enabled = false;
          size = 20;
          passes = 3;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.16, 1, 0.3, 1";
        animation = [
          "windows, 1, 5, myBezier, popin 80%"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 5, default"
          "workspaces, 1, 6, myBezier"
        ];
        first_launch_animation = true;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        font_family = "Inter Variable";
        focus_on_activate = false;
        new_window_takes_over_fullscreen = 0;
        enable_anr_dialog = true;
        # anr_missed_pings = 20;
      };

      input = {
        kb_layout = "us";
        kb_options = "compose:ralt";
        follow_mouse = 1;
        sensitivity = 0.5;

        touchpad = {
          natural_scroll = true;
        };
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_cancel_ratio = 0;
      };

      device = {
        name = "AT Translated Set 2 keyboard";
        enabled = false;
      };

      # windowrulev2 = [        "NIXOS_OZONE_WL, 1"
      #   "suppressevent maximize, class:.*"
      # ];

      cursor = {
        sync_gsettings_theme = true;
        no_hardware_cursors = 2; # change to 1 if want to disable
        enable_hyprcursor = false;
        warp_on_change_workspace = 2;
        no_warps = true;
      };

      env = [
        "NIXOS_OZONE_WL, 1"
        "NIXPKGS_ALLOW_UNFREE, 1"
        "XDG_CURRENT_DESKTOP, Hyprland"
        "XDG_SESSION_TYPE, wayland"
        "XDG_SESSION_DESKTOP, Hyprland"
        "GDK_BACKEND, wayland, x11"
        "CLUTTER_BACKEND, wayland"
        "QT_QPA_PLATFORM=wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
        "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
        "SDL_VIDEODRIVER, x11"
        "MOZ_ENABLE_WAYLAND, 1"
        "AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1"
        "GDK_SCALE,1"
        "QT_SCALE_FACTOR,1"
        "EDITOR,nvim"
      ];
    };
  };
}
