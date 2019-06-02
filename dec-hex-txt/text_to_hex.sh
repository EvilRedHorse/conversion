#! /usr/bin/sh
printf "Text to convert to Hex:\nText:   " && read TEXT
# -A n means do not print offsets and -t x1 means that the type of the input is hexadecimal integers of 1 byte
printf "Hex:   " && printf "$TEXT" | od -A n -t x1 && printf "\n"
exit 0
