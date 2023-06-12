#!/bin/bash
 
adb shell echo "kobles til Android Device via ADB" || exit 1
 
echo "Downloading Retro Arch..."
wget -c "https://buildbot.libretro.com/stable/1.14.0/android/RetroArch.apk"
 
echo "installerer Retro Arch..."
adb install -g RetroArch.apk
adb shell am start -n com.retroarch/.browser.mainmenu.MainMenuActivity
 
echo "laster ned ROMS..."
adb shell mkdir -p /sdcard/roms/nes
mkdir /tmp/nes
cd /tmp/nes
wget -c "https://archive.org/compress/nes-rom-collection" -O nes.zip
unzip nes.zip
adb push *.nes /sdcard/roms/nes/
 
cd
rm -fr /tmp/nes
