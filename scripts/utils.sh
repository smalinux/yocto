#!/bin/bash

# Function to run a command, wait for it to finish, and check its exit status
run_wait_check_status() {
  "$@" &  # Run the command in the background
  PID=$!  # Capture the PID of the background process

  # Wait for the command to finish and capture its exit status
  wait $PID
  STATUS=$?

  # If the command failed, exit the script with an error message
  if [ $STATUS -ne 0 ]; then
    echo "Error: Command failed. Exiting."
    exit 1
  fi
}

