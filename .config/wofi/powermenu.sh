DISPLAY_NAMES=('' '' '' '')
COMMANDS=('hyprlock' 'hyprctl dispatch exit' 'systemctl poweroff' 'systemctl reboot')

MENU_ITEMS=()
for i in "${!DISPLAY_NAMES[@]}"; do
  MENU_ITEMS+=("${DISPLAY_NAMES[i]}")
done

CHOICE=$(printf '%s\n' "${MENU_ITEMS[@]}" | wofi --show dmenu --conf $HOME/.config/wofi/powermenu)

# Extract label from `text:...`
SELECTED_NAME="${CHOICE#*:text:}"

echo $SELECTED_NAME
# Match selection and run command
for i in "${!DISPLAY_NAMES[@]}"; do
  if [[ "${DISPLAY_NAMES[i]}" == "$SELECTED_NAME" ]]; then
    echo "${COMMANDS[i]}"
    eval "${COMMANDS[i]}"
    break
  fi
done
