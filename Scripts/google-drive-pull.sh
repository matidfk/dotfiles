touch /tmp/.google_drive_lock
notify-send "Rclone" "Pulling google drive..." --app-name="Rclone" --icon=folder-google-drive
rclone sync googledrive: /mnt/google_drive --update --backup-dir /home/mat/rclone-backup --progress --verbose --fast-list "$@" 2>&1
# notify-send "Rclone" "$output" --app-name="Rclone" --icon=folder-google-drive
notify-send "Rclone" "Google drive pull finished" --app-name="Rclone" --icon=folder-google-drive
rm /tmp/.google_drive_lock
