#!/bin/bash

echo "Downloading RetroArch..."
pkg install -y wget
wget -c "https://buildbot.libretro.com/stable/1.14.0/android/RetroArch.apk" -P ~/storage/downloads/

echo "Installing RetroArch..."
pkg install -y termux-api
termux-open ~/storage/downloads/RetroArch.apk

echo "Downloading ROMs..."
pkg install -y unzip
mkdir -p ~/storage/roms/nes
cd ~/storage/roms/nes
wget -c "https://archive.org/compress/nes-rom-collection" -O nes.zip
unzip nes.zip "*.nes"
rm nes.zip

echo "Script execution completed."
