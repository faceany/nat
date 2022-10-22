#!/bin/sh

lastipv6=$(cat /data/data/com.termux/files/home/tools/curipv6.txt)

ipv6=$(ip addr show|grep -v deprecated|grep -A1 'inet6 [^f:]'|grep -v ^--|sed -nr ':a;N;s#^ +inet6 ([a-f0-9:]+)/.+? scope global .*? valid_lft ([0-9]+sec) .*#\2 \1#p;Ta'|grep 'ff:fe'|sort -nr|head -n1|cut -d' ' -f2)

echo $ipv6 > /data/data/com.termux/files/home/tools/curipv6.txt

if [ "$ipv6" = "$lastipv6" ];then
echo "same not update"
return 0
fi

wget --no-check-certificate -q -O /data/data/com.termux/files/home/tools/dynv6.log 'http://dynv6.com/api/update?hostname=你的域名&token=你的token&ipv6='$ipv6
echo "update end"
