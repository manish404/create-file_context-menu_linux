#!/bin/bash

# tempates tar file with templates
FILE=templates.tar.xz
if [[ -f "$FILE" ]]; then
    echo "[+] $FILE exists."
else
    echo "[!] $FILE Not found!"
    echo "[!] Exiting program!"
    exit 0
fi

# templates folder
FOLDER=~/Templates
if [ -d "$FOLDER" ]; then
    echo "[+] $FOLDER exists."
else
   echo "[!] $FOLDER doesn't exists!"
   echo "[+] Creating $FOLDER"
   mkdir $FOLDER
   echo "[+] Created $FOLDER"
fi

# check if unzip tool exists
PACKAGE=tar
if [ "$(which $PACKAGE)" = '' ]; then
    echo "[!] Package doesn't exists!"
    echo "[!] Install $PACKAGE package first!"
    echo "[*] Command: sudo install $PACKAGE"
    echo "[!] Exiting program!"
    exit 0
else
    echo "[+] Package exists"
    # unzip tar file
    echo "[+] Extracting templates"
    tar -xf $FILE -C $FOLDER --strip-components=1
    echo "[+] Program successfully terminated."  
fi
