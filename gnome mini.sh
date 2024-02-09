#!/bin/bash

# Install required packages
sudo apt update
sudo apt install -y xorg nala sddm gnome-core openbox-menu bash sudo nano gnome-terminal gnome-settings-daemon nautilus gedit gnome-shell gnome-terminal gnome-text-editor nautilus nautilus-extension-gnome-terminal ffmpegthumbnailer dconf-editor

# Enable sddm and set default graphical target
sudo systemctl enable sddm
sudo systemctl set-default graphical.target

