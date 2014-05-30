#!/bin/sh
# Rafael Mendonca 
# Qui Mai 29 17:24:32 BRT 2014
# 
# Script para gerar saída no formato JSON para Linux / Unix. 
# 
# Variables 
#

FIND=$(which find) 
DIRLOG="/var/log/"

# Begin
for log in $(${FIND} ${DIRLOG} -type f | egrep -v "*.gz.*|*.[0,1].*" | xargs file | grep -v data$ | awk -F\: '{print $1}'); do
    logfile="$logfile,"'{"{#LOGFILE}":"'$log'"}'
done
echo '{"data":['${logfile#,}' ]}'
