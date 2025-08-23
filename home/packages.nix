{
  config,
  pkgs,
  inputs,
  ...
}:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    #System Utilities
    btop
    brightnessctl
    docker-compose
    gcc
    gnumake
    jq
    libnotify
    nvtopPackages.full
    ripgrep
    tree
    unzip
    nodejs_24

    #Clipboard/Screenshots
    copyq
    grim
    slurp
    swappy
    wl-clipboard

    #Fonts
    nerd-fonts.caskaydia-cove
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only

    #Theming
    papirus-icon-theme

    #File Management
    file-roller
    loupe

    #Social
    materialgram

    #Networking
    networkmanagerapplet
    postman

    #browser
    inputs.zen-browser.packages.${pkgs.system}.default

    #Media
    mpv
    obs-studio
    pavucontrol

    #Terminal/Editor
    nixfmt-tree
    wezterm

    #Wayland/Hyprland Utilities
    walker
    rofi-wayland
  ];
}
