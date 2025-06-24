{
  config,
  pkgs,
  dotfiles,
  ...
}:

{
  programs.fastfetch = {
    enable = true;

    settings = {
      display = {
        separator = " ";
      };

      logo = {
        source = "${dotfiles}/assets/nixos.png";
        type = "kitty-direct";
        height = 15;
        width = 25;
        padding = {
          top = 1;
          left = 1;
        };
      };

      modules = [
        "break"
        {
          # Custom message: Using 256-color syntax from the example config
          type = "custom";
          format = " {#36}   I use NixOS BTW"; # Using color #36 (cyan/green) from the example
        }
        {
          type = "os";
          key = "    OS";
          keyColor = "#89b4fa";
        }
        {
          type = "kernel";
          key = "    Kernel";
          keyColor = "#CBA6F7";
        }
        {
          type = "packages";
          key = "    Packages";
          keyColor = "#A6E3AD";
        }
        {
          type = "display";
          key = "  󰍹  Display";
          keyColor = "#89DCEB";
        }
        {
          type = "wm";
          key = "    WM"; # Ret
          keyColor = "#94E2D5";
        }
        {
          type = "terminal";
          key = "    Terminal";
          keyColor = "#F9E2AF";
        }
        {
          type = "cpu";
          format = "{1}";
          key = "    CPU";
          keyColor = "#FAB387";
        }
        {
          type = "gpu";
          key = "  󰍛  GPU";
          keyColor = "#F38BA8";
        }
        {
          type = "memory";
          key = "    Memory";
          keyColor = "#F2CDCD";
        }
        {
          type = "terminalfont";
          key = "    Terminalfont";
          keyColor = "#F5E0DC";
        }
        {
          type = "uptime";
          key = "    Uptime";
          keyColor = "#74C7CE";
        }
        "break"
        {
          type = "custom";
          format = "  {#90}  {#31}  {#33}  {#33}  {#34}  {#35}  {#36}  {#37} ";
        }
        "break"
        "break"
        "break"
      ];
    };
  };
}
