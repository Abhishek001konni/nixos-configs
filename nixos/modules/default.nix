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
  ];
}
