#!/bin/bash

FONTS_DIRECTORY="$HOME/.local/share/fonts";


if [ ! -d $FONTS_DIRECTORY ]; then
   mkdir $FONTS_DIRECTORY
fi

cd $FONTS_DIRECTORY

wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
unzip Hack-v3.003-ttf.zip

