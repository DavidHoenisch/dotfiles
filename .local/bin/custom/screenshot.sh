#!/bin/bash

# Directory where screenshots will be saved
screenshot_dir="$HOME/Pictures/Screenshots"

# Create the directory if it doesn't exist
mkdir -p "$screenshot_dir"

# Filename format: screenshot_YYYY-MM-DD_HH-MM-SS.png
filename="screenshot_$(date '+%Y-%m-%d_%H-%M-%S').png"

# Full path to the screenshot file
filepath="$screenshot_dir/$filename"

# Take the screenshot of a selected area using grim and save it to the file
grim -g "$(slurp)" "$filepath"

# Copy the screenshot to the clipboard using wl-copy
wl-copy < "$filepath"

# Notify the user
notify-send "Screenshot saved as $filename and copied to clipboard"

