Description
----------------------------------
This script allows you to mass import site backups created from an Aegir install.


How it works
--------------------------
You copy the backups from your previous aegir install to a location similar to /var/aegir/tmp/migrate.
This script will migrate any tar.gz file that is located in the migrate directoyr.


How to use it
-------------------
Edit the script and change the variables:

_TMPFOLDER - This is where all your backup.tar.gz files are located.  This needs to be an absolute value
 without a traliing backslash.  Example" "/var/aegir/tmp/migrate"

_INSTPROFILE - This is the install profile you want the sites to be under.  Normal drupal installs are "default".
 Open Atrium's value would be: "openatrium"

_PLATFORM-  use the command "drush sa | grep platform" to see what platforms are available on your aegir system.
 They will look something like:"@platform_drupal6"
 include @ before it

_BACKUPYEAR - This is just what year the backups where created int.  Example:"2011"
