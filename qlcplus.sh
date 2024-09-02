#!/bin/bash
echo "Running entrypoint script"

source /QLC/qtexport.sh

service xrdp start

#qlcplus -w -o /home/admin/Documents/qlc.qxw -p