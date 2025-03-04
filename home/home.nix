{ config, pkgs, ... }:

{
  home.username = "abhishek";
  home.homeDirectory = "/home/abhishek";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    fastfetch
    btop
    vscodium
    kitty
    wofi
    waybar
    brightnessctl
    wl-clipboard
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
  ];

  #ZSH
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

    # Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Basic configuration for git
    programs.git = {
    enable = true;
    userName = "Abhishek001konni";
    userEmail = "abhishek001konni@gmail.com";
    extraConfig = {
      gpg = { format = "ssh"; };
      user = { signingkey = "/home/abhishek/.ssh/id_ed25519"; };
      commit = { gpgsign = true; };
    };
  };

  # vscodium
    programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
    ];
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
