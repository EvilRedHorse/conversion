#! /bin/bash --posix
# Description: converts decimal input
#              outputs json with dec and hex with error as true or false

re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then
   echo "{\"error\": \"true\"}" >&2; exit 1
fi

echo "{\"dec\":$1, \"hex\":\"$(echo 'obase=16;'$1 | bc)\", \"error\":\"false\"}" >&2; exit 0
