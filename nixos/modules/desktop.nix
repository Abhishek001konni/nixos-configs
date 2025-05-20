{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}:

{

  # Enable hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Enable the X11 windowing system.
  services = {
    xserver = {
      enable = true;

      xkb = {
        layout = "us";
        variant = "";
      };

      # Enable LightDM with Slick Greeter
      displayManager = {
        lightdm = {
          enable = true;
          greeters = {
            slick = {
              enable = true;
              # Optional: Configure theme, icon theme, and cursor theme
              # theme = {
              #   name = "Adapta-Nokto";
              #   package = pkgs.adapta-gtk-theme;
              # };
              iconTheme = {
                name = "Papirus-Dark";
                package = pkgs.papirus-icon-theme;
              };
              cursorTheme = {
                name = "Bibata-Modern-Ice";
                package = pkgs.bibata-cursors;
              };
            };
          };
        };
      };

      # displayManager = {
      #     lightdm = {
      #      enable = true;
      #      greeters.gtk = {
      #        enable = true;
      #        theme = {
      #          name = "Adapta-Nokto";
      #          package = pkgs.adapta-gtk-theme;
      #        };

      #        iconTheme = {
      #          name = "Papirus-Dark";
      #          package = pkgs.papirus-icon-theme;
      #        };

      #        cursorTheme = {
      #          name = "Bibata-Modern-Ice";
      #          package = pkgs.bibata-cursors;
      #        };
      #      };
      #    };
      #  };
    };
  };
}
