#!/bin/sh
for file in $@; do
  echo ln -sf `pwd`/$file ~/
  ln -s `pwd`/$file ~/
done
