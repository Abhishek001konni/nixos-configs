{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
   gtk = {
      enable = true;
      font.name = "Inter 10";
      theme = {
        name = "catppuccin-frappe-blue-standard";
        package = pkgs-unstable.catppuccin-gtk;
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs-unstable.papirus-icon-theme;
      };

      gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

      gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    
  };
}
