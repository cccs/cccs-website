#!/usr/bin/env bash

set -u -e

cd `dirname $0`/..

docker build -f Dockerfile-reminders -t cccs-reminders:latest .

