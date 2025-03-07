{ config, pkgs, pkgs-unstable, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs-unstable.vscode;
    extensions = with pkgs-unstable.vscode-extensions; [
      vscodevim.vim
    ];
  };
}