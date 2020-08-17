#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "[!] Please run as root"
  exit
fi
CHECKPYTHON=$(which python3)
echo "[!] Checking if python3 is installed..."
if [ CHECKPYTHON = "" ]
then
    echo "[!] Python3 is NOT installed! Do you wish to install it now? (y/n)"
    read $INSTALLPYTHON
    if [ INSTALLPYTHON = "y" ]
    then
        echo "[+] Installing python3..."
        apt install python3 python3-pip
    fi
else

    echo "[+] Python3 is installed!"
fi
echo "[+] Installing python3 dependencies..."
pip3 install -r requirements.txt
echo "[+] Done!"
echo "[+] Making script executable..."
chmod  +x ./vpnbook-tweet-checker.py
echo "[?] Would you like to install program in your /usr/bin? (y/n)"
read $INSTALLUSRBIN
if [ INSTALLUSRBIN = "y" ]
then
    echo "[+] Copying to /usr/bin..."
    cp ./vpnbook-tweet-checker.py /usr/bin
    echo "[+] Done!"
else
    echo "[=] Okay, VPNBook-Tweet-checker is ready to run!"
fi
if [ INSTALLUSRBIN = "y" ]
then
    echo "[+] VPNBook-Tweet-Checker is ready to run!"
    echo "[+] You can run the script by typing 'vpnbook-tweet-checker' in your terminal."
    exit
fi
