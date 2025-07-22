{
  config,
  pkgs,
  dotfiles,
  ...
}:
let
  wallpaper = "${dotfiles}/assets/wallpaper.png";
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "${wallpaper}" ];

      wallpaper = [
        "eDP-1,${wallpaper}"
      ];

      splash = false;
      ipc = "on";
    };
  };
}
