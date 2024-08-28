#!/bin/bash

echo "Running entrypoint script"

rc-service xrdp start
rc-service xrdp-sesman start

export QT_QPA_PLATFORM=offscreen

qlcplus -w -o /home/admin/Documents/qlc.qxw -p
