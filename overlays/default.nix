{ inputs, ... }:
[
  (import ./flameshot.nix)
  inputs.hyprpanel.overlay
]
