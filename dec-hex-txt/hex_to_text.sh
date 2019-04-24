#! /usr/bin/sh

printf "Hex to convert to Text:\nHex:   "
read HEX
printf "Text:   "
echo $HEX |  xxd -r -c 256 -ps

# move down 1 line at end
printf "\n"
exit 0
