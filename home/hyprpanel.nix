{ config, pkgs, lib, inputs, ... }:

{
  # Import the HyprPanel Home Manager module
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  # Add the HyprPanel overlay
  nixpkgs.overlays = [
    inputs.hyprpanel.overlay
  ];

 programs.hyprpanel = {
    enable = true;
    systemd.enable = true;
    hyprland.enable = true;
    overwrite.enable = true;
    theme = "catppuccin_mocha_split";

    override = {
      theme.bar.menus.text = "#123ABC";
    };

    layout = {
      "bar.layouts" = {
        "0" = {
          left = [ "dashboard" "workspaces" "netstat"];
          middle = [ "clock" ];
          right = [ "network" "volume" "systray" "notifications" "power" ];
        };
      };
    };

    settings = {
      bar.launcher.autoDetectIcon = true;
      bar.workspaces.show_icons = true;
      bar.clock.format = "%a %b %d  %I:%M %p";

      menus.clock = {
        time = {
          military = false;
          hideSeconds = true;
        };
        weather.unit = "metric";
      };

      menus.dashboard.directories.enabled = false;
      menus.dashboard.stats.enable_gpu = true;
      menus.clock.weather.location = "Toronto";
      theme.bar.transparent = true;

      theme.font = {
        name = "CaskaydiaCove NF";
        size = "16px";
      };
    };
  };
}

