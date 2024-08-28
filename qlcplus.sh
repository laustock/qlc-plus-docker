#!/bin/bash

echo "Running entrypoint script"

xrdp
xrdp-sesman

export QT_QPA_PLATFORM=offscreen

qlcplus -w -o /home/admin/Documents/qlc.qxw -p
