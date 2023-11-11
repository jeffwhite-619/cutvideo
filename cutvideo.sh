#! /bin/bash

FILE_IN=
FILE_OUT=
END_TIME=
START_TIME=00:00:00
FORMAT=mp4

while test $# -gt 0; do
  case "$1" in
    -i|--in)
      shift
      echo "Input: "$1
      FILE_IN=$1 
      if [ ! -f "$1" ]; then
        echo "File not found: "$1
        exit
      fi
      shift
      ;;
    -s|--start)
      shift
      echo "start time: "$1
      START_TIME=$1
      shift
      ;;
    -t|--to)
      shift
      echo "end time: "$1
      END_TIME=$1
      shift
      ;;
    -o|--out)
      shift
      echo "Output: "$1
      FILE_OUT=$1
      shift
      ;;
    -f|--format)
      shift
      echo "Format: "$1
      FORMAT=$1
      shift
      ;;
    *)
      echo "wildcard: "$1
      break
      ;;
  esac
done
if [ -v "$FILE_OUT" ];then
  FILE_OUT="$FILE_IN"
fi
TEMPFILE="_temp_"$FILE_OUT

ffmpeg -i "$FILE_IN" -ss $START_TIME -to $END_TIME -f $FORMAT "$TEMPFILE"
mv "$TEMPFILE" "$FILE_OUT"
if [ "$FILE_IN" != "$FILE_OUT" ];then
    rm "$FILE_IN"
fi