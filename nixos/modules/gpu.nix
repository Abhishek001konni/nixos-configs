{
  config,
  lib,
  pkgs,
  inputs,
  hyprPkgs,
  ...
}:
{

  # Load AMD GPU at boot (needed for display)
  boot.initrd.kernelModules = [ "amdgpu" ];

  # Enable OpenGL (AMD default, NVIDIA 32-bit offload)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    package = hyprPkgs.mesa;
    package32 = hyprPkgs.pkgsi686Linux.mesa;
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

  services.xserver.videoDrivers = [ "nvidia" ];

  # Tools and utilities
  environment.systemPackages = with pkgs; [
    mesa-demos
    vulkan-tools
    libva
    libva-utils
  ];
}
