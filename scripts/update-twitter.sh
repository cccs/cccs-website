#!/bin/bash

if ! `which t > /dev/null 2>&1` ; then
  echo "t not found. Please install from http://sferik.github.com/t/"
  exit 2
fi

if [ -n "$TWITTER_USER" ] ; then
  TWITTER_USER=$1
fi

EXPANDLINKS="ruby `dirname $0`/expandlinks.rb"

if [ -f twitter.csv ] ; then
  # Update timeline backup
  LASTID=`head -n 1 twitter.csv| cut -f 1 -d ","`
  t timeline @${TWITTER_USER} --number 3200 --csv -s $LASTID | sed '1d' > twitter-update.csv.unexpanded
  $EXPANDLINKS twitter-update.csv.unexpanded twitter-update.csv || exit 1
  rm twitter-update.csv.unexpanded
  mv twitter.csv twitter.csv.old
  cat twitter-update.csv twitter.csv.old > twitter.csv
  rm twitter.csv.old twitter-update.csv
else
  # Full fetch
  t timeline @${TWITTER_USER} --number 3200 --csv | sed '1d' > twitter.csv.unexpanded
  $EXPANDLINKS twitter.csv.unexpanded twitter.csv
  rm twitter.csv.unexpanded
fi

