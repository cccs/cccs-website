#!/bin/bash

WEBSITE_DIR=${WEBSITE_DIR:-output}
if [[ -f "/usr/local/bundle/bin/t" ]] ; then
  T=/usr/local/bundle/bin/t
else
  T="bundle exec t"
fi
if [[ -f "/usr/local/bin/tweet-reminders.rb" ]] ; then
  REMINDERS=/usr/local/bin/tweet-reminders.rb
else
  REMINDERS=scripts/tweet-reminders.rb
fi
TOOT=${TOOT:-/usr/local/bin/toot}

cd `dirname $0`/..

cat "$WEBSITE_DIR/cccs.ical" | "$REMINDERS" 0 "Heute:" | while read LINE ; do
	$T update "$LINE"
done
cat "$WEBSITE_DIR/cccs.ical" | "$REMINDERS" 1 "Morgen:" | while read LINE ; do
	$T update "$LINE"
done
cat "$WEBSITE_DIR/cccs.ical" | "$REMINDERS" 7 "In einer Woche:" | while read LINE ; do
	$T update "$LINE"
done

cat "$WEBSITE_DIR/cccs.ical" | "$REMINDERS" 0 "Heute:" 500 | while read LINE ; do
	$TOOT "$LINE"
done
cat "$WEBSITE_DIR/cccs.ical" | "$REMINDERS" 1 "Morgen:" 500 | while read LINE ; do
	$TOOT "$LINE"
done
cat "$WEBSITE_DIR/cccs.ical" | "$REMINDERS" 7 "In einer Woche:" 500 | while read LINE ; do
	$TOOT "$LINE"
done


