#!/bin/sh
# touch /tmp/.google_drive_lock

# exit if rclone is already running
pgrep -x "rclone" > /dev/null && exit 0
notify-send "Rclone" "Syncing google drive..." --app-name="Rclone" --icon=folder-google-drive
rclone bisync /mnt/google_drive googledrive: --progress --verbose "$@" 2>&1
# notify-send "Rclone" "$output" --app-name="Rclone" --icon=folder-google-drive
notify-send "Rclone" "Google drive sync finished" --app-name="Rclone" --icon=folder-google-drive
# rm /tmp/.google_drive_lock
