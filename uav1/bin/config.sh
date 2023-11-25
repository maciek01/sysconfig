
rm -rf $HOME/.profile $HOME/bin $HOME/main.cfg

ln -s $HOME/sysconfig/$HOSTNAME/.profile $HOME/.profile
ln -s $HOME/sysconfig/$HOSTNAME/main.cfg $HOME/main.cfg
ln -s $HOME/sysconfig/$HOSTNAME/bin $HOME/bin
