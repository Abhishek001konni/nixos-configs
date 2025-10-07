{
  config,
  pkgs,
  inputs,
  ...
}:

{
  # Import Hyprland Home Manager module
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = {
      # Monitors
      monitor = [ "eDP-1, 1920x1080@60, 0x0, 1" ];

      # environment variables
      env = [
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "GTK_THEME,catppuccin-mocha-blue-standard"
      ];

      # Variables for programs
      "$terminal" = "kitty";
      "$fileManager" = "nautilus";
      #"$screenshot" = "flameshot gui";
      "$menu" = "vicinae";
      "$browser" = "firefox";
      "$mainMod" = "SUPER";

      # Autostart
      "exec-once" = [
        "hyprpaper"
        "hyprlock"
        "copyq --start-server"
      ];

      # General settings
      general = {
        gaps_in = 2;
        gaps_out = 15;
        border_size = 2;
        "col.active_border" = "rgba(cba6f7ee) rgba(89b4faee) rgba(94e2d5ee) 45deg";
        "col.inactive_border" = "rgba(1e1e2eaa)";
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };

      # Decoration
      decoration = {
        rounding = 5;
        rounding_power = 4.0;
        active_opacity = 1.0;
        inactive_opacity = 0.7;
        shadow = {
          enabled = false;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
        blur = {
          enabled = true;
          brightness = 1.0;
          contrast = 1.0;
          noise = 0.01;

          ignore_opacity = true;
          new_optimizations = true;
          xray = false;
          vibrancy = 0.2;
          vibrancy_darkness = 0.5;

          passes = 4;
          size = 7;

          popups = true;
          popups_ignorealpha = 0.2;
        };
      };

      # Animations
      animations = {
        enabled = true;

        bezier = [
          "md3_standard, 0.2, 0, 0, 1.0"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"

          "overshot, 0.05, 0.9, 0.1, 1.05"
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "wind, 0.05, 0.9, 0.1, 1.05"

          "winIn, .09,1.16,.18,1.2"
          "winOut, 0.3, -0.3, 0, 1"

          "liner, 1, 1, 1, 1"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
        ];

        animation = [
          "border, 1, 10, default"
          "borderangle, 1, 8, default"

          "windows, 1, 7, wind, slide"
          "windowsIn, 1, 5, winIn, slide"
          "windowsOut, 1, 4, winOut, slide"
          "windowsMove, 1, 5, wind, slide"

          "fade, 1, 7, md3_decel"
          "fadeIn, 1, 3, md3_decel"
          "fadeOut, 1, 3, md3_accel"

          "layers, 1, 4, wind"
          "layersIn, 1, 3, winIn, slide"
          "layersOut, 1, 3, winOut"
          "fadeLayersIn, 1, 4, wind"
          "fadeLayersOut, 1, 2, md3_accel"

          "workspaces, 1, 6, overshot, slide"
          "workspacesIn, 1, 6, overshot, slide"
          "workspacesOut, 1, 6, overshot, slide"
          "specialWorkspace, 1, 6, md3_decel, slide"
        ];
      };

      # Dwindle layout
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # Master layout
      master = {
        new_status = "master";
      };

      # Miscellaneous
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
      debug = {
        disable_logs = true; # Enable full logging
      };

      # Input
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };

      # Per-device input config
      device = [
        {
          name = "epic-mouse-v1";
          sensitivity = -0.5;
        }
      ];

      binds = {
        allow_workspace_cycles = true;
      };

      # Keybindings
      bind = [
        "$mainMod, Return, exec, $terminal"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, O, exec, $fileManager"
        "$mainMod, SPACE, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo,"
        "$mainMod, V, togglesplit,"
        "$mainMod, G, togglegroup,"
        "$mainMod, F, fullscreen"
        "$mainMod, W, exec, $browser"
        "$mainMod, E, exec, zen"
        "$mainMod CTRL, L, exec, hyprlock"
        "$mainMod, S, exec, rofi-screenshot-script"
        "$mainMod, C, exec, copyq show"
        "$mainMod, X, exec, rofi-powermenu-script"
        "ALT, Tab, workspace, previous"
        "$mainMod, N, exec, pkill -SIGUSR1 waybar"

        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, j, movewindow, d"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, l, movewindow, r"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod SHIFT, S, togglespecialworkspace, magic"
        "$mainMod CTRL SHIFT, S, movetoworkspace, special:magic"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        "$mainMod, B, exec, hyprctl keyword decoration:inactive_opacity $([ $(hyprctl getoption decoration:inactive_opacity -j | jq -r '.float') = '0.700000' ] && echo '1.0' || echo '0.7')"

      ];

      binde = [
        "ALT, h, resizeactive, -20 0"
        "ALT, l, resizeactive, 20 0"
        "ALT, k, resizeactive, 0 -20"
        "ALT, j, resizeactive, 0 20"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      bindl = [
        ",XF86AudioNext, exec, playerctl next"
        ",XF86AudioPause, exec, playerctl play-pause"
        ",XF86AudioPlay, exec, playerctl play-pause"
        ",XF86AudioPrev, exec, playerctl previous"
      ];

      # Window and workspace rules
      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        "float,class:^(com\\.github\\.hluk\\.copyq)$"
      ];
      # layer rules
      layerrule = [
        "blur, rofi"
        "ignorezero, rofi"
        "ignorealpha 0.2, rofi"
        "blur,notifications"
        "ignorezero,notifications"
        "blur,swaync-notification-window"
        "ignorezero,swaync-notification-window"
        "blur,swaync-control-center"
        "ignorezero,swaync-control-center"
      ];
    };
  };
}
