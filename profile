# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/vendor_perl:/usr/bin/core_perl"
export PATH="$PATH:$HOME/dev/shell"
export PATH="$PATH:/usr/lib/cw"
export PATH="$PATH:/usr/lib/python2.7/Tools/i18n"
export PATH="$PATH:$HOME/.gem/ruby/1.9.1/bin"
export PATH="$PATH:/opt/sourcenavigator/bin"
# export PATH="$PATH:/opt/android-sdk/tools"
# export PATH="$PATH:/opt/android-sdk/platform-tools"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/app" ] ; then
    PATH="$HOME/app:$PATH"
fi
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/scripts" ] ; then
    PATH="$HOME/scripts:$HOME/scripts/webapp:$PATH"
fi

export EDITOR=vim
export WWW=/srv/http
export LANG=zh_TW.UTF-8

export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd"

# Python
# export PYTHONPATH=/usr/lib/python3.3/site-packages

