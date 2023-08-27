#!/bin/bash

# This script attempts to download the NineML libraries and a recent
# version of Saxon. It requires bash and has only been very lightly
# tested. YMMV.

mkdir -p lib

download() {
    proj=$1
    lcproj=`echo $proj | tr '[:upper:'] '[:lower:]'`
    uri="https://github.com/nineml/$lcproj/releases/latest"
    ver=`curl -sI $uri | grep -i location: | sed "s#^.*/tag/##" | tr -d '\n\r'`
    if [ ! -f "lib/$proj-$ver.jar" ]; then
        echo "Downloading $proj ..."
        rm -f lib/$proj-*.jar
        uri="https://github.com/nineml/$lcproj/releases/download/$ver/$lcproj-$ver.zip"
        curl -s -L -o lib/$lcproj-$ver.zip $uri
        cd lib
        unzip -q -j $lcproj-$ver.zip "*.jar"
        rm $lcproj-$ver.zip
        cd ..
    fi
}

download CoffeeGrinder
download CoffeeFilter
download CoffeeSacks

if [ ! -d lib/xmlcalabash1-coffeepress.jar ]; then
    echo "Downloading CoffeePress ..."
    curl -s -L -o coffeepress.zip \
         https://github.com/ndw/xmlcalabash1-coffeepress/releases/download/1.0.0/xmlcalabash1-coffeepress-1.0.0.zip
    unzip -q -j coffeepress.zip "*.jar"
    mv *.jar lib/
    rm -f coffeepress.zip
fi

if [ ! -d xmlcalabash-1.5.7-120 ]; then
    echo "Downloading XML Calabash ..."
    curl -s -L -o xmlcalabash.zip \
         https://github.com/ndw/xmlcalabash1/releases/download/1.5.7-120/xmlcalabash-1.5.7-120.zip
    unzip -q xmlcalabash.zip
    rm -f xmlcalabash.zip
fi
