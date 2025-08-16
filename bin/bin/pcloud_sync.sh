#!/bin/bash
# /*
# * --------------------------------------------------------------------
# * @file    pcloud-bkp
# * @brief   A simple backup util for pcloud
# * @author  smk (sudhanshumohan781@gmail.com)
# * @version 20221129
# * @license BSD3
# * @bugs    No known bugs
# * --------------------------------------------------------------------
# */

set -e
set -o pipefail

SERVER=$(hostname -s)
REMOTE="pcloud:vps_bkp/${SERVER}"
RCLONE_BIN=/opt/smkbin/rclone

MYDIR="/"
FILTER="/root/.dotfiles/conf/filter.txt"
BACKUPLIST="/root/.config/rclone/bak.list"
VERBOSE=""
LOG="/tmp/rclone_log.txt"

pushd ${MYDIR}

# Perform Actual Backup
echo "Performing Sync to ${REMOTE}..."

# nice rclone sync / ${REMOTE}/latest --backup-dir ${REMOTE}/${OLDEST} --filter-from ${FILTER} ${VERBOSE} --skip-links --update --use-server-modtime &>> ${LOG}
# Borg Handles Archiving VPS State, so just sync latest dir state
nice ${RCLONE_BIN} sync / ${REMOTE}/latest --filter-from ${FILTER} ${VERBOSE} --skip-links --update --use-server-modtime &>> ${LOG}
echo "...done"

popd
