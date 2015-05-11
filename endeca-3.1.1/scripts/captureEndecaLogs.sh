#!/bin/sh

function explain(){
  echo "Aggregate all Endeca logs to a single output stream that have been touched since a given time period.  Can > the stream to a file."
  echo " "
  echo "Usage:"
  echo " ./captureLogs.sh [directory] [time(minutes] [number of lines to tail]"
  echo " "
  echo " -d directory is a recursive search"
  echo " -m follows standard find logic"
  echo " -n number of lines to tail"
  echo " -h help"
}

#$1 - directory to search
#$2 - time in minutes to check for file changes
C="="
function separator (){
  SEPARATOR=""
  i=1
  LENGTH=50
  if [ ! -z "$1" ]; then
    LENGTH=$1
  fi
  while [ "$i" -le "$LENGTH" ]
  do
    SEPARATOR=$SEPARATOR$C
    i=$(($i + 1));
  done
  echo $SEPARATOR;
}
if [ "-h" = "$1" -o "$#" = 0 ]; then
  explain;
  exit 0;
fi

FILES=$( find $1 -mmin $2 \( -iname "*log*.*" -or -iname "*.log" -or -iname "*.out" \) -and \( ! -iname "*.dat" -and ! -iname "*.lck" -and ! -iname "*.ctrl" \) );

echo $FILES

separator;
echo "--> BEGINING AGGREGATION <--"
separator;

for i in $FILES
do
  echo $i
done
separator;
for i in $FILES
do
  echo $i
  tail -n$3 $i
  echo " "
  separator;
done

