#!/usr/bin/env bash
# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"

# Options
shutdown=''
reboot=''
logout=''

# Rofi CMD
wofi_cmd() {
	wofi -dmenu \
		-mesg "Uptime: $uptime" \
		-theme "$HOME/.config/wofi/powermenu.rasi"
}


# Pass variables to rofi dmenu
run_wofi() {
	echo -e "$shutdown\n$reboot\n$logout" | wofi_cmd
}


# Actions
chosen="$(run_wofi)"
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
