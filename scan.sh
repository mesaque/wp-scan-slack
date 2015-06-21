#!/bin/bash

basedir=$(dirname $0);
filter_name=$( echo ${1} | sed 's~http[s]*://~~g' | sed 's=/[^/]*$==;s/\.$//' )
[ "$1" ] || {
	echo "Missing Web site parameter";
	exit 1;
}

[ ! -d $basedir/dump ] && mkdir -p $basedir/dump

source $basedir/app.conf

ruby $wp_scan_path --url $1 --batch --random-agent --log &> $basedir/dump/${filter_name}.txt

problems_found=$( cat $basedir/dump/${filter_name}.txt | grep '[!]' | sed 's/[^ ]* //' | tr '&' '&amp;' | tr '<' '&lt;' | tr '>' '&gt;' | tr ' ' _  )

$basedir/slack_notification "WP-Scan of ${1}" "${problems_found}" ${basedir}
