#!/bin/bash

SERVER=$(hostname -s)
REMOTE="pcloud:vps_bkp/${SERVER}"

MYDIR="/"
FILTER="/root/.config/rclone/filter.txt"
BACKUPLIST="/root/.config/rclone/bak.list"
VERBOSE=""
LOG="/tmp/rclone_log.txt"

pushd ${MYDIR}



popd
