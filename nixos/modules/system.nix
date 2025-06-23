{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Experimental Features
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable pam authentication
  security.pam.services.hyprlock = { };

  # Enable Polkit
  security.polkit.enable = true;

  # Enable bluetooth and blueman
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Enable D-Bus
  services.dbus.enable = true;

  # Enable power profiles daemon
  services.power-profiles-daemon.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Nautilus
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };

  # Shared services
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  #programs.xfconf.enable = true;
  services.udisks2.enable = true;

  # Thunar related services
  # programs.thunar = {
  #   enable = true;
  #   plugins = with pkgs; [
  #     xfce.thunar-volman
  #     xfce.thunar-archive-plugin
  #   ];
  # };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  programs.ssh.startAgent = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
}
