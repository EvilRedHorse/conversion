#!/usr/bin/env sh
# convert Pi to $SCALE decimal places

#Start  timer
START=$( date +%s )

# Calculate Pi
printf "how many decimal places to calculate: " && read SCALE && printf "\n\n"
printf "$(echo "scale=$SCALE; 4*a(1)" | BC_LINE_LENGTH=0 bc -l)\n"

# Calculate/display time to calulate pi.
END=$( date +%s )
TIME=$( echo "$END-$START" | bc)
printf "\n\n"$TIME" seconds to calulate Pi to $SCALE decimal places.\n"
