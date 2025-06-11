{
  config,
  pkgs,
  ...
}:
let
  catppuccinVariant = "mocha";
  catppuccinAccent = "blue";
  catppuccinSize = "standard";

  catppuccinGtk = pkgs.catppuccin-gtk.override {
    variant = catppuccinVariant;
    accents = [ catppuccinAccent ];
    size = catppuccinSize;
  };
in
{
  gtk = {
    enable = true;
    font.name = "Inter 10";
    theme = {
      name = "catppuccin-${catppuccinVariant}-${catppuccinAccent}-${catppuccinSize}";
      package = catppuccinGtk;
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
