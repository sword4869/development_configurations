#! /bin/sh
# Date: 20210426
# Author: Create by volume
# Description: alpine start up
# Version: 1

# if you want more mirrors, go to https://mirrors.alpinelinux.org/

echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse" > /etc/apt/sources.list

# if you don't update & upgrade, then there will be a error, "Error relocating /usr/bin/ssh: __localtime64_r: symbol not found".	
apt update
echo 'we hava updated, but we do not upgrade.'

exit 0