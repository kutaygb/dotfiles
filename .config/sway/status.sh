#!/bin/bash
BAT=$(upower -i $(upower -e | grep -i bat) | grep percentage | awk '{print $2}')
STATUS=$(upower -i $(upower -e | grep -i bat) | grep state | awk '{print $2}')
echo "🔋 $BAT ($STATUS) | $(date +'%Y-%m-%d %X')"

# Add charging/discharging icon
if [ "$STATUS" = "Charging" ]; then
    ICON="🔌"
elif [ "$BAT" -le 20 ] 2>/dev/null; then
    ICON="🪫"
else
    ICON="🔋"
fi

echo "$ICON $BAT | $(date +'%Y-%m-%d %X')"
