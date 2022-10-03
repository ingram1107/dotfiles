#!/bin/sh
# Incremental backup using tar

is_mounted=false

# Replace the following value with your preferences
source_path="/"             # where should be backup
target_path="/mnt/Marlin"   # where should the backup stored
backup_name=system
compress_method=xz          # gz, bzip, xz or lz

grep -q " $target_path " /proc/mounts && is_mounted=true  # Check whether $target_path has been mounted

if [ $is_mounted ]; then
  echo -e "Check if there is backup in $target_path..."
  if [ -f "$target_path/$backup_name-latest.tar" ]; then
    echo -e "'$backup_name-latest.$compress_opt' exists, proceed to incremental backup procedure"
    cd $target_path && cp -v $backup_name-latest.tar $backup_name-$(date -r $backup_name-latest.tar +%Y-%m-%d).tar
    cd $target_path && tar upvf $backup_name-latest.tar --exclude=/mnt/* /
  else
    echo -e "'$backup_name-latest.$compress_opt' doesn't exist, proceed to initial backup procedure"
    cd $target_path && tar cpvf $backup_name-latest.tar --exclude=/mnt/* /
  fi
else
  echo -e "backup: no drive mounted onto $target_path"
  exit 1
fi
