self: super: {
  flameshot = super.flameshot.overrideAttrs (oldAttrs: {
    cmakeFlags = (oldAttrs.cmakeFlags or [ ]) ++ [ "-DUSE_WAYLAND_GRIM=ON" ];
    buildInputs = (oldAttrs.buildInputs or [ ]) ++ [ super.grim ];
  });
}
