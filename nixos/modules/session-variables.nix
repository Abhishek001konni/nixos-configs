{
  config,
  lib,
  pkgs,
  ...
}:

{
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "radeonsi"; # AMD hardware acceleration
    NIXOS_OZONE_WL = "1"; # Prefer Wayland in apps
    WLR_NO_HARDWARE_CURSORS = "1"; # Optional: fixes cursor glitches
  };
}
