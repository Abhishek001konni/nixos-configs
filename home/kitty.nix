{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  programs.kitty = {
  enable = true;
  package = pkgs-unstable.kitty;
  settings = {
    dynamic_background_opacity = true;
    background_opacity = "0.5";
    confirm_os_window_close = 0;
      };
};
}
