{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    fastfetch
    btop
    kitty
    wofi
    waybar
    brightnessctl
    wl-clipboard
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
  ];
}