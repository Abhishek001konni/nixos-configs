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
    wofi
    brightnessctl
    wl-clipboard
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    nixfmt-rfc-style
    tree
    gcc
    wezterm
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.caskaydia-cove
    nerd-fonts.symbols-only
    bibata-cursors
  ];

}
