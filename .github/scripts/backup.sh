#!/bin/bash

# --- CONFIGURATION ---
BACKUP_FILE="tmate-data-backup.tar.gz"
HOME_DIR="/home/runner" 
# REPO NAME INSERTED HERE: The workspace directory for DevHusk
WORKSPACE_DIR="/home/runner/work/DevHusk/DevHusk" 
# --- END CONFIGURATION ---

echo "Starting data backup..."

# Archives the /home/runner contents, excluding the repository checkout and large temporary files.
tar -czvf $BACKUP_FILE \
  --exclude='node_modules' \
  --exclude='*.log' \
  --exclude='.cache' \
  --exclude="$WORKSPACE_DIR" \
  --directory="$HOME_DIR" .
  
echo "Backup complete. Archive saved as: $BACKUP_FILE"
