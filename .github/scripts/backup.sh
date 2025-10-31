#!/bin/bash

# --- CONFIGURATION ---
# Define the file name for the backup archive
BACKUP_FILE="tmate-data-backup.tar.gz"

# Define the directory where data should be saved (usually the runner's home)
HOME_DIR="/home/runner" 
# The workspace directory where the repo is checked out. 
# !!! CRITICAL: REPLACE 'YOUR_REPO_NAME' with the actual name of your repository !!!
WORKSPACE_DIR="/home/runner/work/YOUR_REPO_NAME/YOUR_REPO_NAME" 
# --- END CONFIGURATION ---

echo "Starting data backup..."

# This command archives the entire /home/runner directory contents
# while excluding the git repository itself and common junk files.
# CRITICAL: If you save data anywhere else (like /var/lib/mysql), you MUST include it here.
tar -czvf $BACKUP_FILE \
  --exclude='node_modules' \
  --exclude='*.log' \
  --exclude='.cache' \
  --exclude="$WORKSPACE_DIR" \
  --directory="$HOME_DIR" .
  
echo "Backup complete. Archive saved as: $BACKUP_FILE"
