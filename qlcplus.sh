#!/bin/bash
/bin/bash /QLC/qtexport.sh

echo "Running entrypoint script"

source qtexport.sh

qlcplus -w -o /QLC/qlc.qxw -p