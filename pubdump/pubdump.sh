#!/bin/bash

SFTP_TARGET="dump.kcirtap.de@web01.futw.eu"
SFTP_CDPATH="/srv/kcirtap.de/htdocs/dump/"
URL_BASE="https://dump.kcirtap.de/"

if [ $# -eq 1 -a -d "$1" ]; then
	DIRMODE=1
fi

SHAREKEY=$(pwgen 16 1)

SFTPCOMMANDS="cd $SFTP_CDPATH\nmkdir $SHAREKEY\ncd $SHAREKEY"
for file in "$@"; do
	SFTPCOMMANDS+="\nput $file"
done

echo -e $SFTPCOMMANDS | sftp $SFTP_TARGET

echo -e "The files were dumped for key $SHAREKEY\nhave a look: $URL_BASE$SHAREKEY"
