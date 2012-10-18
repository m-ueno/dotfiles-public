echo run ~/.dropbox-dist/dropboxd
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
mkdir -p ~/bin
wget -O ~/bin/dropbox.py "http://www.dropbox.com/download?dl=packages/dropbox.py"
chmod u+x ~/bin/dropbox.py
