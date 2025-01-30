#!/usr/bin/bash

#[Task 1]: Define the backup source directory
targetDirectory="/home/ahmedjoseph07/passwords"
destinationDirectory="/home/ahmedjoseph07/backups"


#[Task 2]: Display the target and destination directory paths
echo "Source Directory: $targetDirectory"
echo "Destination Directory: $destinationDirectory"

#[Task 3]: Set the current timestamp
currentTS=$(date +%s)
echo "Current Timestamp: $currentTS"

#[Task 4]: Set the backup file name
backupFileName="backup-$currentTS.tar.gz"
echo "Backup File Name: $backupFileName"

#[Task 5]: Define the absolute path of the source directory
origAbsPath=$(realpath "$targetDirectory")
echo "Original Absolute Path: $origAbsPath"

#[Task 6]: Define the absolute path of the destination directory
destAbsPath=$(realpath "$destinationDirectory")
echo "Destination Absolute Path: $destAbsPath"

#[Task 7]: Change the current working directory to targetDirectory
cd "$targetDirectory" || { echo "Failed to change directory to $targetDirectory"; exit 1; }
echo "Current Working Directory: $(pwd)"

#[Task 8]: Set the timestamp for 24 hours ago
yesterdayTS=$((currentTS - 86400)) #86400s = 1 day
echo "Timestamp for 24 hours ago: $yesterdayTS"

#[Task 9]: List all files and directories modified in the last 24 hours
filesModifiedInLast24Hours=$(find "$targetDirectory" -type f -mtime -1)
echo "Files and Directories modified in the last 24 hours:"
echo "$filesModifiedInLast24Hours"


#[Task 10]: Check if each file was updated in the past day
for file in $filesModifiedInLast24Hours; do
    if [ $(stat --format=%Y "$file") -ge $yesterdayTS ]; then
    echo "$file was updated in the last 24 hours."
    else
    echo "$file was NOT updated in the last 24 hours."
    fi
done

#[Task 11]: Add the file to the toBackup array
toBackup=()

for file in $filesModifiedInLast24Hours; do
    if [ $(stat --format=%Y "$file") -ge $yesterdayTS ]; then
    toBackup+=("$file")
    echo "$file has been added to the toBackup array."
    fi
done
echo "Files to be backed up: ${toBackup[@]}"

#[Task 12]: Create the backup file
if [ ${#toBackup[@]} -gt 0 ]; then
    tar -czf "$backupFileName" "${toBackup[@]}"
    echo "Backup created: $backupFileName"
else
    echo "No files to back up."
fi

#[Task 13]: Move the backup file to the destination directory
mv "$backupFileName" "$destinationDirectory"
echo "Backup file moved to: $destinationDirectory"

