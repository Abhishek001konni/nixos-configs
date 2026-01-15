{
  config,
  pkgs,
  dotfiles,
  ...
}:
let
  wallpaperPath = "${toString dotfiles}/assets/wallpaper.png";
in
{
  services.hyprpaper.enable = false;

  home.file.".config/hypr/hyprpaper.conf".text = ''
    splash = false
    ipc = on

    wallpaper {
      monitor = eDP-1
      path = ${wallpaperPath}
      fit_mode = cover
    }
  '';
}
