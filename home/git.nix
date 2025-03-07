{ config, pkgs, ... }:

{
  # Basic configuration for git
  programs.git = {
    enable = true;
    userName = "Abhishek001konni";
    userEmail = "abhishek001konni@gmail.com";
    extraConfig = {
      gpg = {
        format = "ssh";
      };
      user = {
        signingkey = "${config.home.homeDirectory}/.ssh/id_ed25519";
      };
      commit = {
        gpgsign = true;
      };
    };
  };

}
