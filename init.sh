#!/bin/bash
set -e

DISPLAY=:1
XVFB=/usr/bin/Xvfb
XVFBARGS="$DISPLAY -ac -screen 0 1024x768x16 +extension RANDR"
PIDFILE="/var/xvfb.pid"

export DISPLAY=$DISPLAY

/sbin/start-stop-daemon --start --quiet --pidfile $PIDFILE --make-pidfile --background --exec $XVFB -- $XVFBARGS
sleep 1

/gopath/bin/app
