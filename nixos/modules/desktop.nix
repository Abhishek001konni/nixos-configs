{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Enable the X11 windowing system.
  services = {
    xserver = {
      enable = true;
      displayManager = {
        lightdm.enable = true;
      };

      desktopManager.xfce.enable = false;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    displayManager.sessionPackages = [ pkgs.hyprland ];
  };
}
