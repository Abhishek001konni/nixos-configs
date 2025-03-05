{ config, pkgs, ... }:

{
  # Define user account
  users.users.abhishek = {
    isNormalUser = true;
    description = "abhishek";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}