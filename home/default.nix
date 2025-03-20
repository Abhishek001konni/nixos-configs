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
  ];
}
