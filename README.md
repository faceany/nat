# nat
内网穿透


启动crontab服务

1.启动服务
crond
2. vi编辑/data/data/com.termux/files/home/tools/dynv6.sh 替换其中的域名和变量
3. chmod 777 /data/data/com.termux/files/home/tools/dynv6.sh
4.配置corntab -e
*/1 * * * * /data/data/com.termux/files/home/tools/dynv6.sh

