#!/bin/bash
TIMEOUTFILE=/tmp/lidclose_switch
TIMEOUT=30
echo $(( $(date +%s) + 30 )) > $TIMEOUTFILE
