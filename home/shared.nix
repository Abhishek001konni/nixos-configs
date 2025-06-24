{ ... }:
let
  dotfiles = builtins.path {
      path = ../dotfiles;
      name = "dotfiles";
    };
in
{
    _module.args = {
        inherit dotfiles;
    };
}
