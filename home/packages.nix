{
  config,
  pkgs,
  ...
}:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
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
    file-roller
    materialgram
  ];

}
