{
  config,
  pkgs,
  username,
  inputs,
  ...
}:

{
  programs.nh = {
    enable = true;
    flake = "${inputs.self.outPath}";
  };
}
