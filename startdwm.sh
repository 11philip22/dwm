#! /bin/bash

export _JAVA_AWT_WM_NONREPARENTING=1 
export AWT_TOOLKIT=MToolkit

# Restart dwm on binary change.
csum=$(sha1sum $(which dwm))
new_csum=""
while true; do
    if [ "$csum" != "$new_csum" ]; then
        csum=$new_csum
        dwm 2> ~/dwm.log
    else
        exit 0
    fi
    new_csum=$(sha1sum $(which dwm))
    sleep 0.5
done &

# Start apps that needs to be started.
feh --bg-center ~/Downloads/Space\ Exploration\ 8.png &
wmname LG3D &