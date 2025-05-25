#!/usr/bin/env bash

# Exit on any error
set -e

# Directory for screenshots
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"

# Generate filename with timestamp
FILENAME="screenshot_$(date '+%Y-%m-%d_%H-%M-%S').png"
FILEPATH="$SCREENSHOT_DIR/$FILENAME"

# Capture screenshot of selected area
if ! grim -g "$(slurp)" "$FILEPATH"; then
    exit 1  # Exit if slurp is canceled (e.g., Escape key)
fi

# Copy screenshot to clipboard
wl-copy < "$FILEPATH"

# Show styled notification with screenshot as icon
notify-send --icon="$FILEPATH" --urgency=normal --expire-time=5000 --hint=int:image-width:128 "Screenshot" "Saved as $FILENAME and copied to clipboard"
