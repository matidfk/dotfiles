#!/bin/sh

# dont run if we are pulling at the same time
if [ -f /tmp/.google_drive_lock ]; then
    notify-send "Rclone" "Skipping push - pull in progress" --app-name="Rclone" --icon=folder-google-drive
else
    notify-send "Rclone" "Pushing google drive..." --app-name="Rclone" --icon=folder-google-drive
    output=$(rclone sync /mnt/google_drive googledrive: --fast-list --update --verbose "$@" 2>&1)
    notify-send "Rclone" "$output" --app-name="Rclone" --icon=folder-google-drive
fi
