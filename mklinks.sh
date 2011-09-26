#!/bin/sh
for file in $@
do
  echo $file
  ln -s `pwd`/$file ~/
done
