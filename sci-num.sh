#! /usr/bin/sh
# Attention: only works for negative exponents
# Title: scientific notation to float
# Author: Stefan Crawford
# Requires: bc
# set to exit on error 
set -o errexit
# take in scientific notation
read SCI
echo "scale=${#SCI}+${SCI##*e-}; ${SCI%e*}"^"${SCI##*e}" | bc
