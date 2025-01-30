# Auto Backup Script

This script automates the process of backing up files that have been modified in the last 24 hours. The backup is compressed into a `.tar.gz` file and moved to a specified destination directory.

## Features

- Backs up only files modified in the last 24 hours.
- Compresses the backup into a `.tar.gz` archive.
- Moves the backup to a specified destination directory.
- Easily configurable source and destination directories.
- Creates a unique backup file name based on the current timestamp.

## Requirements

- Linux-based system (tested on Linux Mint).
- The script assumes the source directory contains files to be backed up and the destination directory is ready for the backup.
- `tar` and `find` utilities installed on the system.
- `realpath` and `stat` utilities for absolute path resolution and file modification checks.

## Setup

1. Clone the repository to your local system:

    ```bash
    git clone https://github.com/ahmedjoseph07/auto-backup.git
    ```

2. Navigate to the project directory:

    ```bash
    cd auto-backup
    ```

3. Make the `backup.sh` script executable:

    ```bash
    chmod +x backup.sh
    ```

4. Modify the `targetDirectory` and `destinationDirectory` variables in the script to match your specific source and destination paths.

## Usage

To run the backup script:

```bash
./backup.sh
