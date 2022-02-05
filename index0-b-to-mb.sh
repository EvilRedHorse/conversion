#! /bin/bash --posix

function b_to_mb {

  # get BASE conversion type
  if [ "$3" = "BASE10" ]; then
    # set for BASE2
    BASE_DIV=1000000
  else
      if [ "$3" = "MIXED" ]; then
      # set for MIXED
      BASE_DIV=1024000
      else
      # set default for BASE2
      BASE_DIV=1048576
      fi
  fi
  # create array from string
  # use bc with 6 digit precision to calculate megabytes from bytes
  ARRAY=($1) && printf "scale=6; ${ARRAY[0]}/$BASE_DIV\n" | bc -l
}
# execute b_to_mb
b_to_mb $1 $2
