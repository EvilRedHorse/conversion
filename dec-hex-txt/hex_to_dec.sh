#! /usr/bin/sh

printf "Hex to convert to Dec:\nHex:   "
read HEX
printf "Dec:   "
#echo $HEX |  xxd -r -c 256 -ps

echo 'ibase=16;obase=A;'$HEX | bc

# move down 1 line at end
printf "\n"
exit 0
