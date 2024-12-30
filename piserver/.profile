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

export MAVEN_HOME=/opt/apache-maven-3.3.9

PATH="$MAVEN_HOME/bin:$PATH"


# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

docker container ls
echo "registry content"
curl -X GET http://piserver:5000/v2/_catalog
curl -X GET http://piserver:5000/v2/uavserver/tags/list
curl -X GET http://piserver:5000/v2/px4-gazebo-headless/tags/list

sudo netstat -tulpn
~/bin/docker-cleanup.sh


#sync config
cd ~/sysconfig/$HOSTNAME
git status
git pull
cd

