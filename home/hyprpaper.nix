{
  config,
  pkgs,
  ...
}:
let
  wallpaper = "~/nixos-configs/dotfiles/assets/wallpaper.jpg";
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ wallpaper ];

      wallpaper = [
        "eDP-1,${wallpaper}"
      ];

      splash = false;
      ipc = "on";
    };
  };
}
