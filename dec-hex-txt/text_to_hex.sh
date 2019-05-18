#! /usr/bin/sh

printf "Text to convert to Hex:\nText:   "
read TEXT
printf "Hex:   "
HEX=$( echo $TEXT |  xxd  -c 256 -ps )
printf ${HEX^^}
# move down 1 line at end
printf "\n"
exit 0
