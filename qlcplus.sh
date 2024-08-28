#!/bin/bash

echo "Running entrypoint script"

service xrdp start

export QT_QPA_PLATFORM=offscreen

qlcplus -w -o /home/admin/Documents/qlc.qxw -p
