#!/bin/sh
# Incremental backup using tar

is_mounted=false

# Replace the following value with your preferences
source_path="/"             # where should be backup
target_path="/mnt/Marlin"   # where should the backup stored
backup_name=system
compress_opt=xz             # gz, bzip, xz or lz

grep -q " $target_path " /proc/mounts && is_mounted=true  # Check whether $target_path has been mounted

if [ $is_mounted ]; then
  echo -e "Check if there is backup in $target_path..."
  if [ -f "$target_path/$backup_name-latest.$compress_opt" ]; then
    echo -e "'$backup_name-latest.$compress_opt' exists, proceed to incremental backup procedure"
    cd $target_path && mv $backup_name-latest.$compress_opt $backup_name-$(date -r $backup_name-latest.$compress_opt +%Y-%m-%d).$compress_opt
    cd $target_path && tar upvJf $backup_name-latest.$compress_opt --exclude=/mnt/* /
  else
    echo -e "'$backup_name-latest.$compress_opt' doesn't exist, proceed to initial backup procedure"
    cd $target_path && tar cpvJf $backup_name-latest.$compress_opt --exclude=/mnt/* /
  fi
else
  echo -e "backup: no drive mounted onto $target_path"
  exit 1
fi
