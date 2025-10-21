{ config, pkgs, ... }:

{
  # Basic configuration for git
  programs.git = {
    enable = true;
    settings = {
      user.name = "Abhishek001konni";
      user.email = "abhishek001konni@gmail.com";
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
