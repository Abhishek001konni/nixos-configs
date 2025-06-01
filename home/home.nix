{
  config,
  pkgs,
  username,
  ...
}:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";

  # Cursor
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.apple-cursor;
    name = "macOS";
    size = 28;
  };

  #Environment variables
  home.sessionVariables = {
    XCURSOR_THEME = "macOS";
    XCURSOR_SIZE = "28";
    HYPRCURSOR_THEME = "macOS";
    HYPRCURSOR_SIZE = "28";
    MOZ_ENABLE_WAYLAND = "1";
  };

  #nix garbage collect
  nix = {
    gc = {
      automatic = true;
      frequency = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
