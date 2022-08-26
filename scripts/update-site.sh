#!/usr/bin/env bash

DEPLOY_TARGET="${1:-incontainer}"
if [[ "$WEBSITE_SOURCE" == "" ]] ; then
  WEBSITE_SOURCE=`dirname $0`/..
fi

# Update site
if [[ -d "$WEBSITE_SOURCE/.git" ]] ; then
  cd $WEBSITE_SOURCE
  git pull || exit 1
else
  git clone git@github.com:cccs/cccs-website.git "$WEBSITE_SOURCE" || exit 1
  cd $WEBSITE_SOURCE
fi

# Update Twitter
cd $WEBSITE_SOURCE/content/_data
../../scripts/update-twitter.sh
git add twitter.csv
git commit -m "Update Twitter"

# Update blog roll
cd $WEBSITE_SOURCE/scripts
./update-planetfeeds.rb ../content/_data/planetcccs-blogroll.yaml ../content/planet-cccs.yaml
git add ../content/planet-cccs.yaml
git commit -m "Update Planet"

# Push changes
cd $WEBSITE_SOURCE
git push

# Update site
rm -rf tmp output
#bundle exec nanoc || exit 1
bundle exec nanoc
rm -f crash.log
umask 0002
bundle exec nanoc deploy -t "$DEPLOY_TARGET"

