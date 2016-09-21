#!/bin/sh

# Step 1: install unison unison-gtk
# Step 2: setup profiles with unison-gtk
# Step 3: run this script

SRC1=/srv/http/dokuwiki
SRC2=$HOME/Dropbox/wiki

/usr/bin/inotifywait -mrq -e create,delete,modify,move $SRC1 $SRC2 | while read line; do
    # echo $line
    /usr/bin/unison wiki-conf       -batch -silent
    /usr/bin/unison wiki-data-pages -batch -silent
    /usr/bin/unison wiki-data-media -batch -silent
    /usr/bin/unison wiki-data-meta  -batch -silent
    /usr/bin/unison wiki-data-attic -batch -silent
done
