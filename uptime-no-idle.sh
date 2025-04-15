#!/usr/bin/env bash

# Define log file
LOG_FILE="uptime-no-idle.log"
FILE="wget_file_temp.iso"
URL="https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/SHA256SUMS"

# Function to log events
log_event() {
    local level="$1"  # Log level (e.g., INFO, ERROR, DEBUG)
    local message="$2" # Log message
    local timestamp=$(date +'%Y-%m-%d %H:%M:%S') # Get current timestamp
    # Append the log entry to the log file
    echo "$timestamp [$level] $message" >> "$LOG_FILE"
    # Optionally, also print to standard error for important messages
    if [[ "$level" == "ERROR" || "$level" == "WARNING" ]]; then
        echo "$timestamp [$level] $message" >&2
    fi
}

# Main script logic starts here
log_event "INFO" "Script started."

# Check if stress test exists, if not don't run
COMMAND="stress"

if ! command -v "$COMMAND" &>/dev/null; then
    log_event "ERROR" "Command '$COMMAND' not found.  Exiting."
else
    log_event "INFO" "Starting Stress Test '$FILE'."
    stress -q --cpu 1 --io 4 --vm 2 --vm-bytes 10128M --timeout 10s
fi

# Check if wget test exists, if not don't run
COMMAND="wget"

if ! command -v "$COMMAND" &>/dev/null; then
    log_event "ERROR" "Command '$COMMAND' not found.  Exiting."
else
    log_event "INFO" "Starting Downloading File '$FILE'."
    wget -q --output-document $FILE $URL
    if [ -f "$FILE" ]; then
        log_event "INFO" "Download '$FILE' finalized."
        rm $FILE
    else
        log_event "ERROR" "Failed to create file '$FILE'."
    fi
fi

# End: Script
log_event "INFO" "Script finished successfully."
exit 0