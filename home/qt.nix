{
  config,
  pkgs,
  ...
}:

{
  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  xdg.configFile."qt5ct/colors/catppuccin-mocha-blue.conf".source =
    ../dotfiles/qt/catppuccin-mocha-blue.conf;
  xdg.configFile."qt6ct/colors/catppuccin-mocha-blue.conf".source =
    ../dotfiles/qt/catppuccin-mocha-blue.conf;

  # Qt5ct configuration
  xdg.configFile."qt5ct/qt5ct.conf".text = ''
    [Appearance]
    color_scheme_path=${config.xdg.configHome}/qt5ct/colors/catppuccin-mocha-blue.conf
    custom_palette=true
    icon_theme=Papirus-Dark
    standard_dialogs=default
    style=Fusion

    [Fonts]
    fixed="DejaVu Sans,12,-1,5,50,0,0,0,0,0,Book"
    general="DejaVu Sans,11,-1,5,50,0,0,0,0,0,Book"

    [Interface]
    activate_item_on_single_click=1
    buttonbox_layout=3
    cursor_flash_time=1000
    dialog_buttons_have_icons=1
    double_click_interval=400
    gui_effects=@Invalid()
    keyboard_scheme=2
    menus_have_icons=true
    show_shortcuts_in_context_menus=true
    stylesheets=@Invalid()
    toolbutton_style=4
    underline_shortcut=1
    wheel_scroll_lines=3

    [Troubleshooting]
    force_raster_widgets=1
    ignored_applications=@Invalid()
  '';

  # Qt6ct configuration
  xdg.configFile."qt6ct/qt6ct.conf".text = ''
    [Appearance]
    color_scheme_path=${config.xdg.configHome}/qt6ct/colors/catppuccin-mocha-blue.conf
    custom_palette=true
    icon_theme=Papirus-Dark
    standard_dialogs=default
    style=Fusion

    [Fonts]
    fixed="DejaVu Sans,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Book"
    general="DejaVu Sans,11,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Book"

    [Interface]
    activate_item_on_single_click=1
    buttonbox_layout=3
    cursor_flash_time=1000
    dialog_buttons_have_icons=1
    double_click_interval=400
    gui_effects=@Invalid()
    keyboard_scheme=2
    menus_have_icons=true
    show_shortcuts_in_context_menus=true
    stylesheets=@Invalid()
    toolbutton_style=4
    underline_shortcut=1
    wheel_scroll_lines=3

    [Troubleshooting]
    force_raster_widgets=1
    ignored_applications=@Invalid()
  '';
}
