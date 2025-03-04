{ config, pkgs, ... }:

{
  home.username = "abhishek";
  home.homeDirectory = "/home/abhishek";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    fastfetch
    btop
  ];


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
