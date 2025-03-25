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
        sddm.enable = true;
        sddm.wayland.enable = true;
      };

      xkb = {
        layout = "us";
        variant = "";
      };
    };
    displayManager.sessionPackages = [ pkgs.hyprland ];
  };
}
