#!/bin/bash

OUTPUT=$(xrandr | grep " connected" | cut -d' ' -f1)

# Check if 2560x1440 @ ~144Hz is available
if xrandr | grep -A1 "^$OUTPUT connected" | grep -q "2560x1440 *143.9"; then
    xrandr --output "$OUTPUT" --mode 2560x1440 --rate 143.97
else
    echo "2K@144Hz not available on $OUTPUT, using default."
fi
