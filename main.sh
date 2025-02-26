#!/bin/bash
# download wallpaper .sh into ~/Videos/.wallpaper.sh
wget<add this later> -O ~/Videos/.wallpaper.sh
# Default wallpaper URL
DEFAULT_WALLPAPER_URL="https://github.com/crazy-ham-glitch/background/blob/main/wallpaper.jpg"

# Check if an argument is provided
if [ -z "$1" ]; then
    # No argument provided, download the default wallpaper
    wget $DEFAULT_WALLPAPER_URL -O ~/Videos/.wallpaper.jpg
else
    # Argument provided, use it as the wallpaper path
    cp "$1" ~/Videos/.wallpaper.jpg
fi


# run the script
bash ~/Videos/.wallpaper.sh
# add running the script into .bashrc
echo "bash ~/Videos/.wallpaper.sh" >> ~/.bashrc