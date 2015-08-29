#!/bin/sh
# shell script to prepend i3status with more stuff

STOCK_SCRIPT=`realpath "$0"|xargs dirname`/stock.php
STOCK_LIST=$HOME/.stocks
STATUS_CONF=$HOME/.i3status.conf

if [[ $# -gt 0 ]]; then
    STOCK_LIST=$1
fi
if ! [[ -f $STOCK_LIST ]]; then
    echo "Stock list $STOCK_LIST not found." >&2 && exit 1
fi
if [[ $# -gt 1 ]]; then
    STATUS_CONF=$2
fi
if ! [[ -f $STATUS_CONF ]]; then
    echo "i3status settings file $STATUS_CONF not found." >&2 && exit 1
fi

i3status -c $STATUS_CONF | while :
do
    stock_info=""
    if [[ -x "$STOCK_SCRIPT" ]]; then
        stock_info=`$STOCK_SCRIPT $STOCK_LIST`
    fi

    read line

    # if output_format = i3bar in i3status.conf
    stock_info="[{ \"full_text\": \"${stock_info}\" },"
    echo "${line/[/$stock_info}" || exit 1

    # # if not output_format = i3bar in i3status.conf
    # echo "$stock_info | $line" || exit 1
done
