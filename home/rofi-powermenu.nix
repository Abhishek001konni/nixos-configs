{ pkgs, ... }:
let
  # Rasi themes
  rofi-powermenu-theme = pkgs.writeText "power-menu.rasi" ''
    * {
        font: "JetBrainsMono Nerd Font Bold 10";
        background-color: #26283b;
        text-color: inherit;
        margin: 0;
        padding: 0;
        spacing: 0;
    }

    window {
        background-color: rgba(30, 30, 46, 0.5);
        border: 2px solid;
        border-color: rgba(139, 180, 250, 0.5);
        border-radius: 8px;
        width: 300px;
        location: center;
        anchor: center;
    }

    mainbox {
        enabled: true;
        spacing: 3;
        margin: 3;
        padding: 0;
        border: 0px solid;
        border-radius: 0px;
        background-color: transparent;
        children: [ "inputbar", "listview" ];
    }

    inputbar {
        enabled: true;
        spacing: 0;
        margin: 6px 6px 0px 6px;
        padding: 8px 12px;
        border: 0px solid;
        border-radius: 9px;
        background-color: rgba(49, 50, 68, 0.7);
        text-color: #cdd6f4;
        children: [ "prompt" ];
    }

    prompt {
        enabled: true;
        background-color: transparent;
        text-color: #f38ba8;
        font: "JetBrainsMono Nerd Font Bold 9";
    }

    listview {
        enabled: true;
        columns: 1;
        lines: 4;
        cycle: true;
        dynamic: true;
        scrollbar: false;
        layout: vertical;
        reverse: false;
        fixed-height: true;
        fixed-columns: true;
        spacing: 2px;
        margin: 6px;
        padding: 0px;
        border: 0px solid;
        border-radius: 0px;
        background-color: transparent;
        text-color: #cdd6f4;
        cursor: "default";
    }

    element {
        enabled: true;
        spacing: 0px;
        margin: 1px;
        padding: 15px;
        border: 0px solid;
        border-radius: 8px;
        background-color: rgba(49, 50, 68, 0.5);
        text-color: #cdd6f4;
        cursor: pointer;
    }

    element normal.normal {
        background-color: rgba(49, 50, 68, 0.5);
        text-color: #cdd6f4;
    }

    element normal.urgent {
        background-color: rgba(49, 50, 68, 0.5);
        text-color: #cdd6f4;
    }

    element normal.active {
        background-color: rgba(49, 50, 68, 0.5);
        text-color: #cdd6f4;
    }

    element selected.normal {
        background-color: #89b4fa;
        text-color: #1e1e2e;
    }

    element selected.urgent {
        background-color: #89b4fa;
        text-color: #1e1e2e;
    }

    element selected.active {
        background-color: #89b4fa;
        text-color: #1e1e2e;
    }

    element alternate.normal {
        background-color: rgba(49, 50, 68, 0.5);
        text-color: #cdd6f4;
    }

    element alternate.urgent {
        background-color: rgba(49, 50, 68, 0.5);
        text-color: #cdd6f4;
    }

    element alternate.active {
        background-color: rgba(49, 50, 68, 0.5);
        text-color: #cdd6f4;
    }

    element-text {
        background-color: transparent;
        text-color: inherit;
        highlight: inherit;
        cursor: inherit;
        vertical-align: 0.5;
        horizontal-align: 0.5;
        margin: 0px;
        padding: 0px;
        expand: true;
    }

    /* Hide unused elements */
    textbox-prompt-colon {
        enabled: false;
    }

    entry {
        enabled: false;
    }

    case-indicator {
        enabled: false;
    }

    mode-switcher {
        enabled: false;
    }

    message {
        enabled: false;
    }
  '';

  rofi-confirm-theme = pkgs.writeText "confirm.rasi" ''
    * {
        font: "JetBrainsMono Nerd Font Bold 10";
        background-color: #26283b;
        text-color: #cdd6f4;
        margin: 0;
        padding: 0;
        spacing: 0;
    }

    window {
        background-color: rgba(30, 30, 46, 0.92);
        border: 2px solid;
        border-color: rgba(139, 180, 250, 0.5);
        border-radius: 8px;
        width: 250px;
        location: center;
        anchor: center;
    }

    mainbox {
        enabled: true;
        spacing: 3;
        margin: 3;
        padding: 0;
        border: 3px solid;
        border-radius: 0px;
        background-color: transparent;
        children: [ "listview" ];
    }

    listview {
        enabled: true;
        columns: 1;
        lines: 2;
        cycle: true;
        dynamic: true;
        scrollbar: false;
        layout: vertical;
        fixed-height: true;
        fixed-columns: true;
        spacing: 2px;
        margin: 4px 0 4px 0;
        padding: 0px;
        border: 0px solid;
        border-radius: 0px;
        background-color: transparent;
        text-color: #cdd6f4;
    }

    element {
        enabled: true;
        spacing: 0px;
        margin: 1px;
        padding: 10px;
        border: 0px solid;
        border-radius: 6px;
        background-color: rgba(49, 50, 68, 0.7);
        text-color: #cdd6f4;
        cursor: pointer;
    }

    element selected.normal,
    element selected.active,
    element selected.urgent {
        background-color: #89b4fa;
        text-color: #1e1e2e;
    }

    element alternate.normal,
    element alternate.active,
    element alternate.urgent {
        background-color: rgba(49, 50, 68, 0.5);
        text-color: #cdd6f4;
    }

    element-text {
        background-color: transparent;
        text-color: inherit;
        highlight: inherit;
        cursor: inherit;
        vertical-align: 0.5;
        horizontal-align: 0.5;
    }

    inputbar, prompt, textbox-prompt-colon, entry, case-indicator, mode-switcher, message {
        enabled: false;
    }
  '';

  rofi-powermenu-script = pkgs.writeShellScriptBin "rofi-powermenu-script" ''
    #!/usr/bin/env bash

    ROFI_THEME="${rofi-powermenu-theme}"
    CONFIRM_THEME="${rofi-confirm-theme}"

    # Extract the uptime part (everything between "up" and the comma before users)
    UPTIME=$(uptime | sed -E 's/^[^,]*up *//; s/, *[[:digit:]]* users.*//; s/min/minutes/; s/([[:digit:]]+):0?([[:digit:]]+)/\1 hours, \2 minutes/')

    OPTIONS="Power Off
    Reboot
    Logout
    Sleep"

    confirm_action() {
      local action="$1"
      local question=""
      local yes_text=""
      local no_text=""

      case "$action" in
      "poweroff")
        question="Are you sure you want to power off?"
        yes_text="⚡ Power Off"
        no_text="✖ Cancel"
        ;;
      "reboot")
        question="Are you sure you want to reboot?"
        yes_text="🔄 Reboot"
        no_text="✖ Cancel"
        ;;
      "logout")
        question="Are you sure you want to logout?"
        yes_text="🚪 Logout"
        no_text="✖ Cancel"
        ;;
      "sleep")
        question="Are you sure you want to sleep?"
        yes_text="💤 Sleep"
        no_text="✖ Cancel"
        ;;
      esac

      CONFIRM=$(echo -e "$yes_text\n$no_text" | rofi \
        -dmenu \
        -i \
        -no-custom \
        -format "s" \
        -normal-window false \
        -p "$question" \
        -theme "$CONFIRM_THEME")

      # Check if user selected the action (not cancel)
      [ "$CONFIRM" = "$yes_text" ]
    }

    SELECTED=$(echo -e "$OPTIONS" | rofi \
      -dmenu \
      -i \
      -theme "$ROFI_THEME" \
      -no-custom \
      -format "s" \
      -normal-window false \
      -p "󰔟 Uptime: $UPTIME")

    case "$SELECTED" in
    "Power Off")
      if confirm_action "poweroff"; then
        notify-send "Power Menu" "Shutting down..." -t 2000
        sleep 1
        systemctl poweroff
      fi
      ;;
    "Reboot")
      if confirm_action "reboot"; then
        notify-send "Power Menu" "Rebooting..." -t 2000
        sleep 1
        systemctl reboot
      fi
      ;;
    "Logout")
      if confirm_action "logout"; then
        notify-send "Power Menu" "Logging out..." -t 2000
        sleep 1
        loginctl terminate-user "$USER"
      fi
      ;;
    "Sleep")
      if confirm_action "sleep"; then
        notify-send "Power Menu" "Going to sleep..." -t 2000
        sleep 1
        systemctl suspend
      fi
      ;;
    *)
      exit 0
      ;;
    esac
  '';
in
{
  home.packages = [ rofi-powermenu-script ];
}
