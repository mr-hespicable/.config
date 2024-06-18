#!/usr/bin/env bash

if [ -d "~/screenshots" ]; then
    mkdir ~/screenshots
fi

grim -g "$(slurp)" "$HOME/screenshots/$(date '+%Y%m%d_%Hh%Mm%Ss')_grim.png" | wl-copy
