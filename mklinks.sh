#!/bin/sh
for file in $@; do
  echo ln -s `pwd`/$file ~/
  ln -s `pwd`/$file ~/
done
