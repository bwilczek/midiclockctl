#!/bin/bash

echo "Check for existing binary..."

echo "Check pre-requisites..."
which wget || (echo wget not found ; exit 1)
which unzip || (echo unzip not found ; exit 1)
which gcc || (echo gcc not found ; exit 1)

echo "Download midiclock source from github..."
wget https://github.com/widdly/midiclock/archive/refs/heads/master.zip

echo "Unzip midiclock..."
unzip master.zip

echo "Build midiclock..."
cd midiclock-master
gcc -o midiclock midiclock.c -lasound -llo
cd ..

echo "Remove midiclock source zip..."
rm master.zip
