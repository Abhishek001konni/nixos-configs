{
  config,
  pkgs,
  ...
}:

{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    shellIntegration.enableZshIntegration = true;
    themeFile = "Catppuccin-Mocha";
    settings = {
      dynamic_background_opacity = true;
      background_opacity = "0.70";
      confirm_os_window_close = 0;
    };
  };
}
