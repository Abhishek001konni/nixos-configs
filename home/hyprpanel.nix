{
  config,
  pkgs,
  lib,
  ...
}:

let
  homeDir = config.home.homeDirectory or "~";
in
{
  # Add the activation hook to create a writable symlink at runtime
  home.activation.linkHyprpanel = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -L "${homeDir}/.config/hyprpanel" ]; then
      rm -rf "${homeDir}/.config/hyprpanel"
      ln -s "${homeDir}/nixos-configs/dotfiles/hyprpanel" "${homeDir}/.config/hyprpanel"
    fi
  '';
}
