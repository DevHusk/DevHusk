#!/bin/bash

# --- CONFIGURATION ---
# Define the file name for the backup archive
BACKUP_FILE="tmate-data-backup.tar.gz"

# Define the directory where files should be restored to
HOME_DIR="/home/runner" 
# --- END CONFIGURATION ---

# Check if the artifact was downloaded successfully
if [ -f "/tmp/data_artifact/$BACKUP_FILE" ]; then
    echo "Previous session data found! Restoring..."
    
    # Move the archive to the workspace for easy access
    mv /tmp/data_artifact/$BACKUP_FILE .
    
    # CRITICAL: Extract the archive content back to the home directory
    # The -C flag ensures files are extracted relative to the target directory.
    tar -xzvf $BACKUP_FILE -C "$HOME_DIR"
    
    echo "Data restoration complete."
    
    # Clean up the archive
    rm $BACKUP_FILE
else
    echo "No previous session data artifact found. Starting with a clean environment."
fi
