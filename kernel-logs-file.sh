#!/bin/bash

set -e

log_dir="/var/log/kernel-logs/kernel-logs"
log_filename="kernel-logs-$(date +'%Y-%m-%dT%H-%M')"
log_compressfile="$log_dir/$log_filename.tar.bz2"
dbxcli=/home/mohammad/bin/dbxcli

mkdir -p  $log_dir

journalctl --since "1 hour ago" -k > $log_dir/$log_filename.txt

tar -cjvf $log_compressfile $log_dir/$log_filename.txt

rm -f $log_dir/$log_filename.txt

$dbxcli put "$log_compressfile" /kernal_logs/$log_filename

