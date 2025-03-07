{ config, pkgs, ... }:

{
  # Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
