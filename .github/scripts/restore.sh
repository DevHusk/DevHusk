#!/bin/bash

# --- CONFIGURATION ---
BACKUP_FILE="tmate-data-backup.tar.gz"
HOME_DIR="/home/runner" 
# --- END CONFIGURATION ---

# Check if the artifact was downloaded to the temporary location
if [ -f "/tmp/data_artifact/$BACKUP_FILE" ]; then
    echo "Previous session data found! Restoring..."
    
    # Move the archive to the workspace
    mv /tmp/data_artifact/$BACKUP_FILE .
    
    # Extract the archive content back to the home directory
    tar -xzvf $BACKUP_FILE -C "$HOME_DIR"
    
    echo "Data restoration complete."
    
    # Clean up the archive
    rm $BACKUP_FILE
else
    echo "No previous session data artifact found. Starting with a clean environment."
fi
