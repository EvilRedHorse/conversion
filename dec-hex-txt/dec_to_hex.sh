#! /usr/bin/sh

printf "Dec to convert to Hex:\nDec:   "
read DEC
printf "Hex:   "
#echo $DEC |  xxd -r -c 256 -ps


echo 'obase=16;'$DEC | bc

# move down 1 line at end
printf "\n"
exit 0
