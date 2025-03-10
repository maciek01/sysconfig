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

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi



export EDITOR='vi'
export VISUAL='vi'



alias get_idf='. $HOME/esp/esp-idf/export.sh'

source /home/maciek/venv-ardupilot/bin/activate
export PATH=/opt/gcc-arm-none-eabi-10-2020-q4-major/bin:$PATH
export PATH=/home/maciek/ArduPilot/ardupilot/Tools/autotest:$PATH
export PATH=/usr/lib/ccache:$PATH



#sync config
#cd ~/sysconfig/$HOSTNAME
#git status
#git pull
#cd

