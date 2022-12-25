#!/usr/bin/env bash
# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"

# Options
shutdown=''
reboot=''
logout=''

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-mesg "Uptime: $uptime" \
		-theme "$HOME/.config/rofi/powermenu.rasi"
}


# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$shutdown\n$reboot\n$logout" | rofi_cmd
}


# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
      systemctl poweroff
        ;;
    $reboot)
      systemctl reboot
        ;;
    $logout)
      bspc quit
        ;;
esac
