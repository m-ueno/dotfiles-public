echo run ~/.dropbox-dist/dropboxd
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
curl -L https://www.dropbox.com/download?dl=packages/dropbox.py > ~/bin
