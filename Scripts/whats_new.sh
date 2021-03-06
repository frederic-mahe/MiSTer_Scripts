#!/bin/bash

# test for input
# TODO: validate integer value to set input
if [ -z "$1" ]
  then
    # Modified time in days:
    mdays=2
  else
    mdays="$1"
fi

mhours=$(($mdays * 24))

echo "Here is what's new in _Arcade in the last [$mhours] hours ($mdays days):"
find /media/fat/_Arcade/ -mtime -$mdays -iname "*mra"|\
while read -r mra
  do
    echo " -" `basename "$mra"` "["`date +"%a, %b %d" -r "$mra"`"]"
  done

echo
echo "Here is what's new in compiled Mister Cores in the last [$mhours] hours ($mdays days):"
find /media/fat/ -mtime -$mdays -iname "*rbf"|\
  while read -r rbf
    do
      echo " -" `dirname "$rbf"| sed 's/\/media\/fat\///g'` : `basename $rbf` "["`date +"%a, %b %d" -r "$rbf"`"]"
    done


