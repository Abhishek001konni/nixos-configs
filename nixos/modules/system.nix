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

  # Allow unfree packages
  # nixpkgs.config.allowUnfree = true;

  # Environment variables
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "radeonsi"; # AMD hardware acceleration
    NIXOS_OZONE_WL = "1"; # Prefer Wayland in apps
    WLR_NO_HARDWARE_CURSORS = "1"; # Optional: fixes cursor glitches
  };

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable pam authentication
  security.pam.services.hyprlock = { };

  # Enable Polkit
  security.polkit.enable = true;

  # Enable polkit_gnome
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wants = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  # Enable D-Bus
  services.dbus.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Nautilus
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };

  # Thunar related services
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      xfce.thunar-volman
      xfce.thunar-archive-plugin
    ];
  };
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  programs.xfconf.enable = true;
  services.udisks2.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  programs.ssh.startAgent = true;

  # Enable sound with pipewire.
  # services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
}
