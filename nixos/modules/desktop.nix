{
  config,
  lib,
  pkgs,
  username,
  inputs,
  ...
}:

{
  # Import Hyprland NixOS module
  imports = [
    inputs.hyprland.nixosModules.default
  ];

  # Hyprland (Wayland) setup
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # XDG
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  # Greetd
  services.greetd = {
    enable = true;
    vt = 7;
    settings = {
      default_session = {
        command = "Hyprland";
        user = username;
      };
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

  services = {
    xserver = {
      enable = true;

      xkb = {
        layout = "us";
        variant = "";
      };

      # displayManager = {
      #   lightdm = {
      #     enable = true;
      #     greeters = {
      #       slick = {
      #         enable = true;
      #         extraConfig = ''
      #         wayland=true
      #       '';
      #         iconTheme = {
      #           name = "Papirus-Dark";
      #           package = pkgs.papirus-icon-theme;
      #         };
      #         cursorTheme = {
      #           name = "Bibata-Modern-Ice";
      #           package = pkgs.bibata-cursors;
      #         };
      #       };
      #     };
      #   };
      # };
    };
  };
}
