#!/bin/bash

basedir=$(dirname $0);
[ "$1" ] || {
	echo "Missing Web site parameter";
	exit 1;
} 

source $basedir/app.conf

ruby $wp_scan_path --url $1 --batch --random-agent --log &> $basedir/dump/${1}.txt

problems_found=$( cat $basedir/dump/${1}.txt | grep '[!]' | sed 's/[^ ]* //' | tr '&' '&amp;' | tr '<' '&lt;' | tr '>' '&gt;' | tr ' ' _  )

$basedir/slack_notification "WP-Scan of ${1}" "${problems_found}" ${basedir}
