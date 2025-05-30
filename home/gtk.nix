{
  config,
  pkgs,
  ...
}:

{
  gtk = {
    enable = true;
    font.name = "Inter 10";
    theme = {
      name = "catppuccin-frappe-blue-standard";
      package = pkgs.catppuccin-gtk;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    gtk3.extraConfig = {
      "gtk-application-prefer-dark-theme" = "1";
    };

    gtk4.extraConfig = {
      "gtk-application-prefer-dark-theme" = "1";
    };

  };
}
