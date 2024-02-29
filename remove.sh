#!/usr/bin/bash

TARGET_DIR="/tmp"
DAYS=7
OLD_FILES=$(sudo find  "$TARGET_DIR" -type f -mtime +$DAYS)

if [ -z "${OLD_FILES[0]}" ]; then
        echo "No files found"
        exit 0
fi

echo "Files to be deleted:"
echo "$OLD_FILES"

read -p "Are you sure you want to delete these files?[y/n]" ANSWER

if [[ $ANSWER != "y" ]]; then
        echo "Canceled"
        exit 0
fi

echo "Deleting files..."
rm "$OLD_FILES"

sleep 1

echo "Files deleted"
