{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs-unstable; [
    fastfetch
    btop
    kitty
    wofi
    waybar
    brightnessctl
    wl-clipboard
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    nixfmt-rfc-style
    tree
  ];

}
