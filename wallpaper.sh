#!/bin/bash

# Path to the new wallpaper
WALLPAPER_PATH="~/Videos/.wallpaper.jpg"

# Detect the desktop environment
if [ "$XDG_CURRENT_DESKTOP" = "GNOME" ]; then
    # Change wallpaper for GNOME
    gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPER_PATH"
elif [ "$XDG_CURRENT_DESKTOP" = "KDE" ]; then
    # Change wallpaper for KDE
    qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "
    var allDesktops = desktops();
    for (i=0;i<allDesktops.length;i++) {
        d = allDesktops[i];
        d.wallpaperPlugin = 'org.kde.image';
        d.currentConfigGroup = Array('Wallpaper', 'org.kde.image', 'General');
        d.writeConfig('Image', 'file://$WALLPAPER_PATH');
    }"
elif [ "$XDG_CURRENT_DESKTOP" = "XFCE" ]; then
    # Change wallpaper for XFCE
    xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s "$WALLPAPER_PATH"
else
    exit 1
fi