{ pkgs, ... }:
let
  rofi-screenshot-theme = pkgs.writeText "screenshot.rasi" ''
    /* Rofi Screenshot Menu Theme - Archcraft-inspired */

    * {
        font: "JetBrainsMono Nerd Font Bold 10";
        background-color: #26283b;
        text-color: inherit;
        margin: 0;
        padding: 0;
        spacing: 0;
    }

    window {
        background-color: rgba(30, 30, 46, 0.9);
        border: 2px solid;
        border-color: rgba(139, 180, 250, 0.5);
        border-radius: 8px;
        width: 300px;
        location: center;
        anchor: center;
    }

    mainbox {
        enabled: true;
        spacing: 2;
        margin: 2;
        padding: 2;
        border: 0px solid;
        border-radius: 0px;
        background-color: transparent;
        children: [ "listview" ];
    }

    listview {
        enabled: true;
        columns: 1;
        lines: 6;
        cycle: true;
        dynamic: true;
        scrollbar: false;
        layout: vertical;
        reverse: false;
        fixed-height: true;
        fixed-columns: true;
        spacing: 3px;
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
        margin: 0px;
        padding: 8px;
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
        horizontal-align: 0.0;
    }

    /* Hide unused elements */
    inputbar {
        enabled: false;
        spacing: 0;
        margin: 0;
        padding: 0;
        border: 0px solid;
        border-radius: 0px;
        background-color: transparent;
        children: [];
    }

    prompt {
        enabled: false;
    }

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

  rofi-screenshot-script = pkgs.writeShellScriptBin "rofi-screenshot-script" ''
    #!/usr/bin/env bash
    mkdir -p "''$HOME/Pictures/Screenshots"

    OPTIONS="🖥️ Fullscreen
    📐 Selection
    🪟 Window
    🖌️ Fullscreen + Edit
    ✂️ Selection + Edit
    🖼️ Window + Edit"

    countdown() {
      for ((i = ''$1; i > 0; i--)); do
        notify-send -t 1000 "Screenshot in ''$i seconds..."
        sleep 1
      done
    }

    SELECTED=$(echo -e "''$OPTIONS" | rofi \
      -dmenu \
      -i \
      -theme ${rofi-screenshot-theme} \
      -no-custom \
      -format "s" \
      -normal-window false)

    FILENAME="screenshot_$(date +%Y%m%d_%H%M%S).png"
    FILEPATH="''$HOME/Pictures/Screenshots/''$FILENAME"

    case "''$SELECTED" in
    "🖥️ Fullscreen")
      sleep 0.3 && grim "''$FILEPATH" && notify-send "Screenshot" "Fullscreen saved to ''$FILENAME" -i "''$FILEPATH" &
      exit 0
      ;;
    "📐 Selection")
      grim -g "$(slurp)" "''$FILEPATH"
      if [ ''$? -eq 0 ]; then
        notify-send "Screenshot" "Selection saved to ''$FILENAME" -i "''$FILEPATH"
      fi
      ;;
    "🪟 Window")
      (
        countdown 2
        WINDOW_INFO=$(hyprctl activewindow -j)
        if [ "$(echo "''$WINDOW_INFO" | jq -r '.address')" = "0x0" ]; then
          notify-send "Screenshot" "No active window found" -u critical
          exit 1
        fi
        X=$(echo "''$WINDOW_INFO" | jq -r '.at[0]')
        Y=$(echo "''$WINDOW_INFO" | jq -r '.at[1]')
        W=$(echo "''$WINDOW_INFO" | jq -r '.size[0]')
        H=$(echo "''$WINDOW_INFO" | jq -r '.size[1]')
        grim -g "''${X},''${Y} ''${W}x''${H}" "''$FILEPATH"
        notify-send "Screenshot" "Window saved to ''$FILENAME" -i "''$FILEPATH"
      ) &
      exit 0
      ;;
    "🖌️ Fullscreen + Edit")
      countdown 2
      sleep 0.3 && grim - | swappy -f - &
      exit 0
      ;;
    "✂️ Selection + Edit")
      grim -g "$(slurp)" - | swappy -f -
      ;;
    "🖼️ Window + Edit")
      (
        countdown 2
        WINDOW_INFO=$(hyprctl activewindow -j)
        if [ "$(echo "''$WINDOW_INFO" | jq -r '.address')" = "0x0" ]; then
          notify-send "Screenshot" "No active window found" -u critical
          exit 1
        fi
        X=$(echo "''$WINDOW_INFO" | jq -r '.at[0]')
        Y=$(echo "''$WINDOW_INFO" | jq -r '.at[1]')
        W=$(echo "''$WINDOW_INFO" | jq -r '.size[0]')
        H=$(echo "''$WINDOW_INFO" | jq -r '.size[1]')
        grim -g "''${X},''${Y} ''${W}x''${H}" - | swappy -f -
      ) &
      exit 0
      ;;
    *)
      exit 0
      ;;
    esac
  '';
in
{
  # Export the package
  home.packages = [ rofi-screenshot-script ];
}
