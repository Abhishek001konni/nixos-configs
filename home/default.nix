{ config, pkgs, ... }:

{
  imports = [
    ./home.nix
    ./packages.nix
    ./zsh.nix
    ./nvim.nix
    ./git.nix
    ./vscode.nix
    ./hyprland.nix
    ./hyprpanel.nix
    ./kitty.nix
    ./gtk.nix
    ./hyprlock.nix
  ];
}
