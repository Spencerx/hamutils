#!/bin/sh

wget -q -O - 'https://secure.clublog.org/mostwanted.php' | \
	sed -n "/<p><table>/ s/<p><table><tr><th>Rank<\/th><th>Prefix<\/th><th>Entity Name<\/th><\/tr>//; s/<\/table><\/p><\/div>//; s/<tr><td>\([0-9]\+\)\.<\/td><td>\([A-Z0-9/]\+\)<\/td><td><a href='mostwanted2.php?dxcc=[0-9]\+'>\([^<]\+\)<\/a><\/td><\/tr>/\1,\2,\3\n/gp;" \
	> $HOME/.mostwanted.txt

