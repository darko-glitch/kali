#!/bin/bash

# Add Minimize and Maximize Window Buttons
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'

# Night Light Settings
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-from 12.0
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-to 11.9

# Update system
sudo apt update -y

echo "Minimize and Maximize Window Buttons added and Night Light settings configured."

# Install Brave Browser
sudo apt install -y curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update

sudo dpkg --add-architecture i386

# Install Various Packages
sudo nala install -y ufw gnome-shell-extension-dashtodock git gcc g++ make gdb mpv libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly zsh zsh-autosuggestions gstreamer1.0-vaapi build-essential dkms linux-headers-$(uname -r)
sudo apt install -y libc6:amd64 libc6:i386 libegl1:amd64 libegl1:i386 libgbm1:amd64 libgbm1:i386 libgl1-mesa-dri:amd64 libgl1-mesa-dri:i386 libgl1:amd64 libgl1:i386 steam-libs-amd64:amd64 steam-libs-i386:i386

# Configure Firewall (UFW)
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

# Miscellaneous Commands
sudo adduser dark render
sudo adduser dark video

git clone https://gitlab.com/kalilinux/packages/kali-themes.git ~/Downloads/kali-themes
sudo mv -f ~/Downloads/kali-themes/share/themes/Kali* /usr/share/themes/
sudo mv -f ~/Downloads/kali-themes/share/icons/* /usr/share/icons/
sudo mv -f ~/Downloads/kali-themes/share/* /usr/share/
sudo mv -f ~/Downloads/kali-themes/share/backgrounds/* /usr/share/backgrounds
sudo mv -f ~/Downloads/kali-themes/share/gtksourceview-4/styles/* /usr/share/gtksourceview-4/styles
sudo cp ~/Downloads/kali-themes/share/qtermwidget5/color-schemes/Kali-Dark.colorscheme /usr/share/qtermwidget5/color-schemes/Kali-Dark.colorscheme
sudo chmod 755 $(sudo find /usr/share/themes/Kali* -type d)
sudo chmod 644 $(sudo find /usr/share/themes/Kali* -type f)
sudo chmod 755 $(sudo find /usr/share/icons/Flat* -type d)
sudo chmod 644 $(sudo find /usr/share/icons/Flat* -type f)
sudo gtk-update-icon-cache /usr/share/icons/Flat-Remix-Blue-Dark/

# Download and apply Zsh configuration
mv .zshrc ~/.zshrc
chsh -s /bin/zsh
autoload -Uz compinit promptinit

# Copy Kali Linux color scheme for qtermwidget
sudo cp ~/Downloads/kali-themes/share/qtermwidget5/color-schemes/Kali-Dark.colorscheme /usr/share/qtermwidget5/color-schemes/Kali-Dark.colorscheme

# Clean up by removing the cloned repository
rm -rf kali-themes

# Configure Firewall (UFW)
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

# Install Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
eval "$($HOME/miniconda/bin/conda shell.bash hook)"
conda init

# Update Conda and Create a Python Environment
conda update --all -y
conda create -y -n ai python spyder notebook
conda activate ai

# Install TensorFlow-ROCm
pip install tensorflow-rocm

# Update system
sudo apt update -y

sudo apt purge -y iagno lightsoff four-in-a-row gnome-robots pegsolitaire gnome-2048 hitori gnome-klotski gnome-mines quadrapassel swell-foop gnome-tetravex gnome-taquin aisleriot
sudo apt autoremove -y

# Set vm.swappiness to 10
sudo sh -c 'echo "vm.swappiness=10" >> /etc/sysctl.conf'

