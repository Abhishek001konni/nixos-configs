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
  nixpkgs.config.allowUnfree = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Thunar related services
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  programs.xfconf.enable = true;

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
