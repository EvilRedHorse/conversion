#! /usr/bin/sh

printf "Hex to convert to Text:\nHex:   "
read HEX
printf "Text:   "
printf $((16#$HEX))

# move down 1 line at end
printf "\n"
exit 0
