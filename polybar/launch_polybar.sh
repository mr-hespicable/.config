polybar-msg cmd quit &
if type "xrandr"; then
    for m in $(xrandr --query | rg " connected" | cut -d" " -f1); do
	MONITOR=$m polybar --reload main &
    done
else
    polybar --reload main &
fi
