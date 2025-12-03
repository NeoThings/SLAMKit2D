#! /bin/bash

mkdir -p "/home/neo/.local/share/icons"

cp ../asset/icons/radar.png ~/.local/share/icons/
cp ../asset/icons/save_map.png ~/.local/share/icons/
cp ../asset/icons/record.png ~/.local/share/icons/

cp ../asset/configs/slamkit2d_bringup.desktop ~/.local/share/applications/
cp ../asset/configs/save_map.desktop ~/.local/share/applications/
cp ../asset/configs/record_topic.desktop ~/.local/share/applications/

update-desktop-database ~/.local/share/applications
