{ config, pkgs, ... }:

{
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
        "x-scheme-handler/http" = [ "firefox.desktop" ];
        "x-scheme-handler/https" = [ "firefox.desktop" ];
        "text/plain" = [ "nvim.desktop" ];
        "image/png" = [ "org.gnome.Loupe.desktop" ];
        "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
        "video/mp4" = [ "mpv.desktop" ];
        "video/x-matroska" = [ "mpv.desktop" ];
        "application/pdf" = [ "firefox.desktop" ];
        "application/zip" = [ "org.gnome.FileRoller.desktop" ];
        "x-terminal-emulator" = [ "kitty.desktop" ];
      };
    };
  };
}
