DISPLAY_NAMES=('' '' '' '')
COMMANDS=('hyprlock' 'hyprctl dispatch exit' 'systemctl poweroff' 'systemctl reboot')

MENU_ITEMS=()
for i in "${!DISPLAY_NAMES[@]}"; do
  MENU_ITEMS+=("text:${DISPLAY_NAMES[i]}")
done

CHOICE=$(printf '%s\n' "${MENU_ITEMS[@]}" | wofi --show dmenu --conf $HOME/.config/wofi/powermenu)

# Extract label from `text:...`
SELECTED_NAME="${CHOICE#*:text:}"

# Match selection and run command
for i in "${!DISPLAY_NAMES[@]}"; do
  if [[ "${DISPLAY_NAMES[i]}" == "$SELECTED_NAME" ]]; then
    eval "${COMMANDS[i]}"
    break
  fi
done
