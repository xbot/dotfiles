#!/bin/sh

if grep Ubuntu /etc/issue > /dev/null 2>&1; then
    gnome-settings-daemon &
    ~/.dropbox-dist/dropboxd &
    ~/app/goagent &
fi
