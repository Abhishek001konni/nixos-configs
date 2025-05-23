{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  # Load AMD GPU at boot (needed for display)
  boot.initrd.kernelModules = [ "amdgpu" ];

  # Enable OpenGL (AMD default, NVIDIA 32-bit offload)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # NVIDIA configuration (offload mode)
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true; # optional, disables dGPU when idle
    powerManagement.finegrained = false;
    open = false; # use proprietary driver
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      offload = {
      enable = true;
      enableOffloadCmd = true;
      };
      amdgpuBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # Hyprland (Wayland) setup
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ]; # still needed so NVIDIA driver gets installed

      xkb = {
        layout = "us";
        variant = "";
      };

      displayManager = {
        lightdm = {
          enable = true;
          greeters = {
            slick = {
              enable = true;
              extraConfig = ''
              wayland=true
            '';
              iconTheme = {
                name = "Papirus-Dark";
                package = pkgs.papirus-icon-theme;
              };
              cursorTheme = {
                name = "Bibata-Modern-Ice";
                package = pkgs.bibata-cursors;
              };
            };
          };
        };
      };
    };
  };

  # Environment variables for Wayland
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "radeonsi"; # AMD hardware acceleration
    NIXOS_OZONE_WL = "1"; # Prefer Wayland in apps
    WLR_NO_HARDWARE_CURSORS = "1"; # Optional: fixes cursor glitches
  };

  # Tools and utilities
  environment.systemPackages = with pkgs; [
    glxinfo
    vulkan-tools
    libva
    libva-utils
    mesa
  ];

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
}

