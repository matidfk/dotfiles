touch /tmp/.google_drive_lock
notify-send "Rclone" "Pulling google drive..." --app-name="Rclone" --icon=folder-google-drive
output=$(rclone sync googledrive: /mnt/google_drive --update --verbose --fast-list "$@" 2>&1)
notify-send "Rclone" "$output" --app-name="Rclone" --icon=folder-google-drive
rm /tmp/.google_drive_lock
