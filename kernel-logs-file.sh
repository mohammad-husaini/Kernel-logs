#!/bin/sh


set -e
log_filename="kernel-logs-$(date +'%Y-%m-%dT%H-%M')"
log_compressfile="$log_filename.tar.bz2"



journalctl --since "1 hour ago" -k > $log_filename.txt

tar -cjvf $log_compressfile $log_filename.txt

dbxcli put "$log_compressfile" /kernal_logs/$log_filename

rm -f $log_compressfile $log_filename.txt
