#!/bin/bash

# Define log file
LOG_FILE="script.log"

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

# Check if log file exists, create if it doesn't
if [ ! -f "$LOG_FILE" ]; then
    touch "$LOG_FILE"
    log_event "INFO" "Log file created: $LOG_FILE"
fi
