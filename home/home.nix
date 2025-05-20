{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  home.username = "abhishek";
  home.homeDirectory = "/home/abhishek";

  # Cursor
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs-unstable.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  #Environment variables
  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "Bibata-Modern-Classic";
    HYPRCURSOR_SIZE = "24";
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
