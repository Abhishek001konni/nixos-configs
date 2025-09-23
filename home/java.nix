{ config, pkgs, ... }:

let
  myjdk = pkgs.zulu25;
in
{
  programs.java = {
    enable = true;
    package = myjdk;
  };

  home.packages = [
    pkgs.maven
    (pkgs.gradle.override { java = myjdk; })
  ];

  home.file.".jdks/zulu-25".source = myjdk;

}
