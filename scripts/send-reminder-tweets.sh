#!/bin/bash

cd `dirname $0`/..

cat output/cccs.ical | scripts/tweet-reminders.rb 0 "Heute:" | while read LINE ; do
	bundle exec t update "$LINE"
done
cat output/cccs.ical | scripts/tweet-reminders.rb 1 "Morgen:" | while read LINE ; do
	bundle exec t update "$LINE"
done
cat output/cccs.ical | scripts/tweet-reminders.rb 7 "In einer Woche:" | while read LINE ; do
	bundle exec t update "$LINE"
done

