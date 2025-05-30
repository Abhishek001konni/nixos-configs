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
    brightnessctl
    wl-clipboard
    nixfmt-rfc-style
    tree
    gcc
    unzip
    jq
    ripgrep
    wezterm
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.caskaydia-cove
    nerd-fonts.symbols-only
    grim
    slurp
    swappy
    hyprpanel
    walker
    brave
    nvtopPackages.full
    mpv
    copyq
    flameshot
    swayimg
  ];

}
