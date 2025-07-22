{ config, pkgs, ... }:

{
  # Fonts
  fonts.packages = with pkgs; [
    font-awesome
    roboto
    inter
    victor-mono
  ];
}
