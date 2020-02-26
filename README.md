Secure-Wordpress
================

Fix permissions for all Wordpress instances installed in a specific folder.

Also supports SELinux Enforcing.

### Installation

1. Clone this script from github or copy the files manually to your preferred directory.

2. Edit both scripts and point 'www' param to your Wordpress folder.
- for example: /var/www/html  

Supports two modes:
- secure-wp will set all permissions to root:root with read access for others.
- unsecure-wp will set all permissions to apache:apache with read access for others. 

the 'unsecure' mode allows users to update Wordpress itself while the 'secure' mode only allows for plugins/themes and content updates.

both modes are set according to wordpress.com instructions.

> wp-config.php is set to root:apache with 640 permissions in both modes. 

Author: [RaveMaker][RaveMaker].

[RaveMaker]: http://ravemaker.net
 
