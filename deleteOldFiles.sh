#!/bin/bash

# Function to delete directories older than a certain number of days
delete_old_directories() {
    local path=$1
    local days=$2

    # Get disk space usage before deletion
    disk_usage_before=$(du -sh "$path" | awk '{print $1}')

    # Count the number of directories before deletion
    count_before=$(find "$path" -mindepth 1 -type d | wc -l)

    # Delete old directories
    find "$path" -mindepth 1 -type d -mtime +$days -exec rm -rf {} \;

    # Get disk space usage after deletion
    disk_usage_after=$(du -sh "$path" | awk '{print $1}')

    # Count the number of directories after deletion
    count_after=$(find "$path" -mindepth 1 -type d | wc -l)

    # Calculate and print the amount of memory freed
    memory_freed=$(echo "$disk_usage_before - $disk_usage_after" | tr -d '[:alpha:]')
    echo "Before deletion: $count_before directories, $disk_usage_before disk space"
    echo "After deletion: $count_after directories, $disk_usage_after disk space"
    echo "Memory freed: ${memory_freed}B"
}

# Specify paths and corresponding retention periods
jenkins_path=""
jenkins_retention_days=30

ui_path=""
ui_retention_days=10

app_automation_path=""
app_automation_retention_days=1

# Delete old directories for each specified path and display counts
delete_old_directories "$jenkins_path" $jenkins_retention_days
delete_old_directories "$ui_path" $ui_retention_days
delete_old_directories "$app_automation_path" $app_automation_retention_days

echo "Cleanup complete."
