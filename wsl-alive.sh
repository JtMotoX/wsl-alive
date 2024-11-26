#!/bin/sh

SCRIPTNAME=`basename "$0"`
ps -e | grep -v -E "^\s*$$ " | grep -q " ${SCRIPTNAME}" && { echo "WSL2 already running"; sleep 1; exit; }
echo This process keeping WSL2 alive
if ! type wsl-notify-send.exe >/dev/null 2>&1; then
	echo "WARN: 'wsl-notify-send.exe' not found. You can download it from the following link to get Windows notification when WSL2 is running in the background: https://github.com/stuartleeks/wsl-notify-send/releases/latest/download/wsl-notify-send_windows_amd64.zip"
else
	wsl-notify-send.exe "WSL2 is running in the background"
fi
sleep infinity
