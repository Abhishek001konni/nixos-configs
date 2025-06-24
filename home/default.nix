{ config, pkgs, ... }:

{
  imports = [
    ./shared.nix
    ./home.nix
    ./packages.nix
    ./zsh.nix
    ./nvim.nix
    ./git.nix
    ./vscode.nix
    ./hyprland.nix
    ./kitty.nix
    ./gtk.nix
    ./hyprlock.nix
    ./fastfetch.nix
    ./waybar.nix
    ./swaync.nix
    ./hyprpaper.nix
    ./rofi-screenshot.nix
    ./rofi-powermenu.nix
    ./qt.nix
    ./xdg.nix
    ./systemd-user-services.nix
  ];
}
