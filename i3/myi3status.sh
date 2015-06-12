#!/bin/sh
# shell script to prepend i3status with more stuff

STOCK_SCRIPT=`realpath "$0"|xargs dirname`/stock.php

i3status | while :
do
    stock_info=""
    if [[ -x "$STOCK_SCRIPT" ]]; then
        stock_info=`$STOCK_SCRIPT`
    fi

    read line

    # if output_format = i3bar in i3status.conf
    stock_info="[{ \"full_text\": \"${stock_info}\" },"
    echo "${line/[/$stock_info}" || exit 1

    # # if not output_format = i3bar in i3status.conf
    # echo "$stock_info | $line" || exit 1
done
