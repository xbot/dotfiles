# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

if [ -d "$HOME/Projects/shell" ] ; then
    PATH="$PATH:$HOME/Projects/shell"
fi
export PATH

export EDITOR=vim
export WWW=/srv/http

export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd"

# fix qt5 theme and icon problem
export QT_QPA_PLATFORMTHEME="qt5ct"
