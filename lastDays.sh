#!/bin/bash
a=""
b=""
for i in $(seq 0 10)
do
    b=$(git diff --shortstat "@{ $i day ago }")
    if [[ "$b" != "$a" ]]; then
        echo $(date --date="$i days ago" +%F) $b
    fi
    a=$b
done

