{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
    shellAliases = {
      vim = "nvim";
    };
    initContent = ''
      # Basic optimizations
      ZSH_DISABLE_COMPFIX="true"
      DISABLE_AUTO_UPDATE="true"
      DISABLE_UPDATE_PROMPT="true"

      # Completion caching
      zstyle ':completion:*' use-cache on
    '';
  };
}
