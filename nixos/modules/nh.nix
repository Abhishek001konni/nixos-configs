{ config, pkgs, ... }:
{
  programs.nh = {
    enable = true;
    flake = "/home/abhishek/nixos-configs";
  };
}
