{
  config,
  lib,
  pkgs,
  ...
}:

{

  # Enable hyprland
  programs.hyprland.enable = true;

  # Enable the X11 windowing system.
  services = {
    xserver = {
      enable = true;
      
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    displayManager = {
        sddm.enable = true;
        sddm.wayland.enable = true;
     };

  };
}
