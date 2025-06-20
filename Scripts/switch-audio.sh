#!/bin/bash
# This script switches between multiple Pulseaudio output devices/sinks
# Created by Jan Keith Darunday <jkcdarunday@gmail.com> as the original script didn't work with pipewire
# This uses pactl instead of pacmd since pacmd is not available in pipewire

SINKS=$(pactl list short sinks)
SINK_COUNT=$(echo "$SINKS" | wc -l)

DEFAULT_SINK=$(pactl info | sed -En 's/Default Sink: (.*)/\1/p')
DEFAULT_SINK_INDEX=$(echo "$SINKS" | grep -n "$DEFAULT_SINK" | grep -E -o '^[0-9]+')

NEW_SINK_INDEX=$((DEFAULT_SINK_INDEX % $SINK_COUNT + 1))
NEW_SINK=$(echo "$SINKS" | sed "${NEW_SINK_INDEX}q;d" | awk '{ print $2 }')

# Set next sink as the default sink
pactl set-default-sink "$NEW_SINK"

# Forward all playing audio (sink inputs) to the new sink
SINK_INPUTS=($(pactl list short sink-inputs | grep -E -o '!.*spotify'))
for SINK_INPUT in ${SINK_INPUTS[*]}; do pactl move-sink-input $SINK_INPUT $NEW_SINK; done

if [[ $1 == "notify" ]]; then
    if [[ "$NEW_SINK" == *"usb"* ]]; then
        notify-send "    Headphones"
    else
        notify-send "󰓃   Speakers"
    fi
fi
