{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./boot.nix
    ./networking.nix
    ./system.nix
    ./desktop.nix
    ./fonts.nix
    ./user.nix
    ./sh.nix
    ./systemPkgs.nix
    ./gpu.nix
    ./nh.nix
    ./substituters.nix
    ./docker.nix
    ./session-variables.nix
    ./audio.nix
  ];
}
