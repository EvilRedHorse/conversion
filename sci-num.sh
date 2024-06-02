#! /usr/bin/sh
# 
# Title: convert if in scientific notation
# Author: Stefan Crawford
# Requires: bc
# sudo dnf -y install bc
# set to exit on error
set -o errexit

sci_remove () {
# convert price when listed in scientific notation
NUM=${1,,};
if [[ $NUM == *"e-"* ]]; then
    NUM=$( echo "scale=${#NUM}+${NUM##*e-}; ${NUM%e*}"*"10^${NUM##*e}" | bc -l);
    echo $NUM;
elif [[ $NUM == *"e+"* ]]; then
    NUM=$( echo "scale=0; ${NUM%e*}/1"*"10^${NUM##*+}" | bc -l);
    echo $NUM;
else
    echo $NUM;
fi
}
# take in scientific notation from $1 to convert from sci or return original value
sci_remove $1;
