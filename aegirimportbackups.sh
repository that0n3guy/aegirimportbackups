#!/bin/bash

# run this like:
# bash aegirimportbackups.sh
# Run this by your aegir user
# the TMPFOLDER should contain backups from your previous aegir install


_TMPFOLDER="/var/aegir/tmp/migrate" #Absolute path to directory where you backups are located, No backslash at the end
_INSTPROFILE="default" #if none, use the word: default
_PLATFORM="@platform_STSBase62014p" #include @ before it
_CLIENT="admin" #admin is the usual client, change this if you want to associate the site with a different client
# YOU NEED TO CHANGE THE YEAR down below on line 36






######EDIT ONLY THE YEAR below######

###---### Functions
#
# Noticeable messages
msg () {
  echo "Aegir IMPORT [`date`] ==> $*"
}


#And here we go

cd $_TMPFOLDER

for f in *.tar.gz
do
  _URL="$(echo $f | sed 's/-2012.*\.tar.gz//g')"
  _FILENAME="$f"
  echo ''
  msg "INFO: Working on site $_URL"
  drush provision-save @$_URL --context_type=site --platform=$_PLATFORM --profile=$_INSTPROFILE --uri=$_URL db_server=@server_localhost --client_name=$_CLIENT
  drush @$_URL provision-deploy $_TMPFOLDER/$_FILENAME
  echo ''
  echo ''
done
msg "INFO: Now go verify your $_PLATFORM platform in the aegir web UI"

