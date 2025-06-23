{
  config,
  pkgs,
  ...
}:

{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
    };

    settings = {
      mainBar = {
        layer = "top";
        height = 52;
        spacing = 5;
        reload_style_on_change = true;

        modules-left = [
          "image"
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "power-profiles-daemon"
          "backlight"
          "pulseaudio"
          "network"
          "tray"
          "battery"
          "custom/notification"
        ];

        "hyprland/window" = {
          format = "{class}";
          icon = false;
          tooltip = false;
          separate-outputs = false;
          rewrite = {
            "kitty" =
              "<span color='#cba6f7' size='large'>󰄛</span> <span color='#cba6f7' size='10240' rise='1536'>Kitty</span>";
            "firefox" =
              "<span color='#f5a97f' size='large'>󰈹</span> <span color='#f5a97f' size='10240' rise='1024'>Firefox</span>";
            "brave-browser" =
              "<span color='#eed49f' size='medium'></span> <span color='#eed49f' size='10240' rise='0'>Brave</span>";
            "org.gnome.Nautilus" =
              "<span color='#89dceb' size='medium'></span> <span color='#89dceb' size='10240' rise='-512'>Files</span>";
            "org.gnome.Loupe" =
              "<span color='#a6e3a1' size='large'></span> <span size='10240' rise='1024'> Image Viewer</span>";
            "io.github.kukuruzka165.materialgram" =
              "<span color='#74c7ec' size='large'></span> <span size='10240' rise='1536'>Telegram</span>";
            "code" =
              "<span color='#04a5e5' size='large'>󰨞</span> <span size='10240' rise='1024'>VS Code</span>";
            "org.gnome.FileRoller" =
              "<span color='#f9e2af' size='large'></span> <span color='#f9e2af' size='10240' rise='1024'> Archive Manager</span>";
            "com.obsproject.Studio" =
              "<span color='#f5e0dc' size='large'></span> <span color='#f5e0dc' size='10240' rise='1024'> OBS Studio</span>";
            "com.github.hluk.copyq" =
              "<span color='#94e2d5' size='large'></span> <span color='#94e2d5' size='10240' rise='1024'>Copyq</span>";
            "org.wezfurlong.wezterm" =
              "<span color='#94e2d5' size='large'></span> <span color='#94e2d5' size='10240' rise='1024'>WezTerm</span>";
            "mpv" =
              "<span color='#c6a0f6' size='large'>󰥠</span> <span color='#f4dbd6' size='10240' rise='1024'>MPV</span>";
            "flameshot" =
              "<span color='#ca9ee6' size='medium'>󰹑</span> <span color='#ca9ee6' size='10240' rise='0'>Flameshot</span>";
            "polkit-gnome-authentication-agent-1" =
              "<span color='#89b4fa' size='medium'></span> <span color='#89b4fa' size='10240' rise='0'>Polkit Agent</span>";
            "MainPicker" =
              "<span color='#ff6b6b' size='large'>󰏘</span> <span size='10240' rise='1024'>Color Picker</span>";
          };
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          "format-icons" = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            urgent = "";
            active = "";
            default = "";
          };
          "sort-by-number" = true;
          "persistent-workspaces" = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
          };
        };

        tray.spacing = 5;

        clock = {
          format = "󰥔 {:%I:%M %p}";
          format-alt = "{:%A, %B %d, %Y (%R)}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "on-scroll" = 1;
            format = {
              months = "<span color='#cba6f7'><b>{}</b></span>";
              days = "<span color='#f5c2e7'>{}</span>";
              weeks = "<span color='#bac2de'><i>W{}</i></span>";
              weekdays = "<span color='#f2cdcd'><b>{}</b></span>";
              today = "<span color='#ed8796'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            "on-click-right" = "mode";
            "on-scroll-up" = "shift_up";
            "on-scroll-down" = "shift_down";
          };
        };

        battery = {
          states.warning = 40;
          format = "{capacity}% {icon}";
          format-icons = [
            "󰂎"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          format-charging = "󰂄 {capacity}%";
          format-warning = "󰂃 {capacity}%";
          tooltip-format = "{capacity}%";
        };

        network = {
          format-wifi = "{icon} {essid}";
          format-icons = [
            "󰤯 "
            "󰤟 "
            "󰤢 "
            "󰤥 "
            "󰤨 "
          ];
          format-ethernet = "";
          format-disconnected = "󰤭 ";
          tooltip-format = "Connected to {essid}";
          tooltip-format-ethernet = "{ifname} ";
          on-click = "hyprctl dispatch exec '[float] nm-connection-editor'";
          on-click-right = "hyprctl dispatch exec nm-applet";
        };

        pulseaudio = {
          "scroll-step" = 5;
          format = "{icon} {volume}%";
          format-muted = "";
          format-icons.default = [
            ""
            ""
            " "
            " "
          ];
          tooltip-format = "{volume}% volume";
          on-click = "wpctl set-mute @DEFAULT_SINK@ toggle";
          on-scroll-up = "wpctl set-volume -l 1.5 @DEFAULT_SINK@ 10%+";
          on-scroll-down = "wpctl set-volume @DEFAULT_SINK@ 10%-";
        };

        backlight = {
          format = "{icon} {percent}%";
          format-icons = [
            "󰃞"
            "󰃟"
            "󰃠"
          ];
          on-scroll-up = "brightnessctl set +5%";
          on-scroll-down = "brightnessctl set 5%-";
          tooltip-format = "Brightness: {percent}%";
        };

        "power-profiles-daemon" = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = " ";
            power-saver = "";
          };
        };

        image = {
          path = toString ./../dotfiles/assets/nix.svg;
          size = 20;
          on-click = "walker";
        };

        "custom/notification" = {
          tooltip = false;
          format = "{icon} {}";
          "format-icons" = {
            notification = "󱅫";
            none = "";
            "dnd-notification" = " ";
            "dnd-none" = "󰂛";
            "inhibited-notification" = " ";
            "inhibited-none" = "";
            "dnd-inhibited-notification" = " ";
            "dnd-inhibited-none" = " ";
          };
          "return-type" = "json";
          "exec-if" = "which swaync-client";
          exec = "swaync-client -swb";
          "on-click" = "sleep 0.1 && swaync-client -t -sw";
          "on-click-right" = "sleep 0.1 && swaync-client -d -sw";
          escape = false;
        };

      };
    };
    style = ''
      @define-color base #1e1e2e;
      @define-color mantle #181825;
      @define-color crust #26283b;

      @define-color text #cdd6f4;
      @define-color subtext0 #a6adc8;
      @define-color subtext1 #bac2de;

      @define-color surface0 #313244;
      @define-color surface1 #45475a;
      @define-color surface2 #585b70;

      @define-color overlay0 #6c7086;
      @define-color overlay1 #7f849c;
      @define-color overlay2 #9399b2;

      @define-color blue #89b4fa;
      @define-color lavender #b4befe;
      @define-color sapphire #74c7ec;
      @define-color sky #89dceb;
      @define-color teal #94e2d5;
      @define-color green #a6e3a1;
      @define-color yellow #f9e2af;
      @define-color peach #fab387;
      @define-color maroon #eba0ac;
      @define-color red #f38ba8;
      @define-color mauve #cba6f7;
      @define-color pink #f5c2e7;
      @define-color flamingo #f2cdcd;
      @define-color rosewater #f5e0dc;

      * {
        font-family: "JetBrainsMono NF", "Symbols Nerd Font";
        font-weight: bolder;
        font-size: 14.5px;
        padding: 2px;
      }

      window#waybar {
        background-color: transparent;
        color: @sapphire;
        transition-property: background-color;
        transition-duration: 0.5s;
      }
      window#waybar.hidden {
        opacity: 0.2;
      }
      window#waybar.empty {
        background-color: transparent;
      }
      window#waybar.empty #window {
        padding: 0px;
        margin: 0px;
        border: 0px;
        background-color: transparent;
      }
      window#waybar.termite {
        background-color: #3f3f3f;
      }
      window#waybar.chromium {
        background-color: #000000;
        border: none;
      }

      .modules-left,
      .modules-center,
      .modules-right {
        background-color: transparent;
      }

      button {
        box-shadow: inset 0 -3px transparent;
        border: none;
        border-radius: 0;
      }

      #workspaces {
        background-color: @crust;
        border-radius: 5px;
        padding: 2px 5px;
        margin: 4px 3px;
      }
      #workspaces button {
        padding: 0 5px;
        color: @surface2;
        margin: 4px 0;
        transition: color 200ms ease-in-out;
      }
      #workspaces button:hover {
        color: @blue;
        background: @crust;
        border: @crust;
      }
      #workspaces button.selected {
        color: @blue;
      }
      #workspaces button.urgent {
        color: @red;
      }
      #workspaces button.persistent {
        color: #fab387;
      }
      #workspaces button.empty {
        color: #363a4f;
      }
      #workspaces button.active,
      #workspaces button.visible {
        color: #c6a0f6;
      }

      #window {
        background-color: @crust;
        border-radius: 5px;
        padding: 0 9px;
        margin: 4px 3px;
      }
      #image {
        background-color: @crust;
        border-radius: 5px;
        padding: 0 9px;
        margin: 4px 3px;
        margin-left: 28px;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #wireplumber,
      #custom-pacman,
      #custom-power,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #mpd,
      #custom-weather,
      #custom-spotify,
      #custom-notification,
      #bluetooth,
      #power-profiles-daemon,
      #keyboard-state,
      #pulseaudio,
      #user {
        padding: 0 10px;
        color: @text;
        border-radius: 5px;
        background-color: @crust;
        margin: 4px 3px;
      }

      #clock { color: @lavender; }
      #battery { color: @green; }
      #battery.warning:not(.charging) { color: @red; }
      #backlight { color: #e5c890; }

      #network {
        color: #c6a0f6;
      }
      #network.disconnected {
        color: @surface2;
        padding-right: 5px;
        padding-left: 9px;
      }

      #pulseaudio {
        color: #ee99a0;
        border-radius: 5px;
        background-color: @crust;
        padding-left: 10px;
        padding-right: 13px;
      }
      #pulseaudio.muted { color: @red; }

      #power-profiles-daemon {
        padding-left: 11px;
        padding-right: 13px;
        color: @yellow;
      }

      #custom-pacman { color: @peach; }

      #custom-power {
        color: @maroon;
        margin-left: 0px;
        margin-right: 9px;
      }

      #custom-spotify { color: #6fcf97; }

      #custom-notification {
        color: #f2cdcd;
        margin-right: 28px;
      }

      #bluetooth {
        font-size: 17px;
        color: @blue;
      }

      #user {
        border: 2px;
      }

      #keyboard-state > label {
        padding: 1px 1px;
        padding-right: 8px;
        padding-left: 8px;
        border-radius: 8px;
        border: 6px;
        background: @crust;
        color: @red;
      }

      #scratchpad {
        background: rgba(0, 0, 0, 0.2);
      }
      #scratchpad.empty {
        background-color: transparent;
      }
    '';
  };
}
