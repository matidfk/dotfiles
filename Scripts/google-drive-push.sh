notify-send "Rclone" "Pushing google drive..." --app-name="Rclone" --icon=folder-google-drive
output=$(rclone sync /mnt/google_drive googledrive: --fast-list --update --verbose "$@" 2>&1)
notify-send "Rclone" "$output" --app-name="Rclone" --icon=folder-google-drive
