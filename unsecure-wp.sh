#! /bin/bash

# This script secure all wordpress folders and files permissions

# This is the folder where all your WordPress installations are:
www=/www

# Loop all folder inside $www and try to locate WordPress installs.
for d in $www/*/; do
    # remove trail / from $d (/www/website instead of /www/website/)
    d=${d%/}
    if [ -f $d/wp-config.php ]; then
	# WordPress Found at $d
	echo "WordPress found! $d"
	chown apache:apache $d -R
	find $d -type d -exec chmod 775 {} \;
	find $d -type f -exec chmod 664 {} \;
	chown root:root $d/wp-config.php
	chmod 644 $d/wp-config.php
    fi
done
