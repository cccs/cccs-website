#!/bin/bash

WEBSITE_DIR=${WEBSITE_DIR:-output}
if [[ -f "/usr/local/bundle/bin/t" ]] ; then
  T=/usr/local/bundle/bin/t
else
  T="bundle exec t"
fi
TOOT=${TOOT:-/usr/local/bin/toot}

cd `dirname $0`/..

cat "$WEBSITE_DIR/cccs.ical" | scripts/tweet-reminders.rb 0 "Heute:" | while read LINE ; do
	$T update "$LINE"
done
cat "$WEBSITE_DIR/cccs.ical" | scripts/tweet-reminders.rb 1 "Morgen:" | while read LINE ; do
	$T update "$LINE"
done
cat "$WEBSITE_DIR/cccs.ical" | scripts/tweet-reminders.rb 7 "In einer Woche:" | while read LINE ; do
	$T update "$LINE"
done

cat "$WEBSITE_DIR/cccs.ical" | scripts/tweet-reminders.rb 0 "Heute:" 500 | while read LINE ; do
	$TOOT "$LINE"
done
cat "$WEBSITE_DIR/cccs.ical" | scripts/tweet-reminders.rb 1 "Morgen:" 500 | while read LINE ; do
	$TOOT "$LINE"
done
cat "$WEBSITE_DIR/cccs.ical" | scripts/tweet-reminders.rb 7 "In einer Woche:" 500 | while read LINE ; do
	$TOOT "$LINE"
done


