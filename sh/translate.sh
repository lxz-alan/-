#!/bin/bash

##################################################
#命令行下翻译脚本，抓取百度翻译结果
##################################################
ARGS=1
E_BADARGS=65
 
if [ $# -ne "$ARGS" ]
then
    echo "Usage:`basename $0` word"
    exit $E_BADARGS
fi
         
w3m -no-cookie -dump 'http://dict.baidu.com/s?wd='$1'&f=3'  \
| sed '1,18d' \
| sed '/以下结果由/,$d' \
>/tmp/rxdict.tmp
         
echo
echo -e "--------------------\033[1;40;33m $1 \033[0m-------------------- \n"

cat /tmp/rxdict.tmp
