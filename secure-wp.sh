#! /bin/bash

# This script secure all wordpress folders and files permissions

# This is the folder where all your WordPress installations are:
www="/www"

# Loop all folder inside $www and try to locate WordPress installs.
for d in "$www"/*/; do
  # remove trail / from $d (/www/website instead of /www/website/)
  d=${d%/}
  if [ -f "$d"/wp-config.php ]; then
    # WordPress Found at $d
    echo "WordPress found! $d"
    chown root:root "$d" -R
    find "$d" -type d -exec chmod 755 {} \;
    find "$d" -type f -exec chmod 644 {} \;
    chown apache:apache "$d"/wp-content -R
    find "$d"/wp-content -type d -exec chmod 777 {} \;
    find "$d"/wp-content -type f -exec chmod 666 {} \;
    chmod 644 "$d"/wp-config.php
    chcon -R -t httpd_sys_content_t "$d"
    chcon -R -t httpd_sys_rw_content_t "$d"/wp-content
  fi
done
