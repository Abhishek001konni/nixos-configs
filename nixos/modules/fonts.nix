{ config, pkgs, ... }:

{
  # Fonts
  fonts.packages = with pkgs; [
    font-awesome
    roboto
  ];
}