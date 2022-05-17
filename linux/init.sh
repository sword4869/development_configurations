#! /bin/sh
# Date: 20210426
# Author: Create by volume
# Description: alpine start up
# Version: 1

# if you want more mirrors, go to https://mirrors.alpinelinux.org/

echo "deb http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib" > /etc/apt/sources.list
echo "deb-src http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib" > /etc/apt/sources.list

echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list
echo "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list

# if you don't update & upgrade, then there will be a error, "Error relocating /usr/bin/ssh: __localtime64_r: symbol not found".	
apt update
apt upgrade

exit 0