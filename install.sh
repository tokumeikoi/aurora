#!/bin/sh
echo '正在安装依赖'
if cat /etc/os-release | grep "centos" > /dev/null
    then
    yum install unzip wget -y > /dev/null
    yum update curl -y
else
    apt-get install unzip wget -y > /dev/null
    apt-get update curl -y
    echo '环境优化'
    ulimit -n 51200
    echo "soft nofile 51200" >> /etc/security/limits.conf
    echo "hard nofile 51200" >> /etc/security/limits.conf
    (cat <<EOF
fs.file-max = 102400
net.core.somaxconn = 1048576
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_timestamps = 1
net.ipv4.tcp_fin_timeout = 30
net.core.default_qdisc = fq
net.ipv4.tcp_congestion_control = bbr
net.ipv4.tcp_fastopen = 3
net.ipv4.tcp_max_syn_backlog = 1048576
net.ipv4.tcp_synack_retries = 1
net.ipv4.tcp_orphan_retries = 1
net.ipv4.ip_local_port_range = 32768 65535
net.ipv4.tcp_mem = 88560 118080 177120
net.ipv4.tcp_wmem = 4096 16384 8388608
EOF
    ) > /etc/sysctl.conf
fi

api=$1
key=$2
nodeId=$3
license=$4
folder=$key-v2ray
if [[ "$6" -ne "" ]]
    then
    syncInterval=$6
else
    syncInterval=60
fi

kill -9 $(ps -ef | grep ${folder} | grep -v grep | grep -v bash | awk '{print $2}') 1 > /dev/null
kill -9 $(ps -ef | grep defunct | grep -v grep | awk '{print $2}') 1 > /dev/null
echo '结束进程'
rm -rf $folder
mkdir $folder
cd $folder
wget https://github.com/tokumeikoi/aurora/releases/latest/download/aurora
wget https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip

unzip v2ray-linux-64.zip
chmod 755 *
nohup `pwd`/aurora -api=$api -token=$key -node=$nodeId -license=$license -syncInterval=$syncInterval > aurora.log 2>&1 &
echo '部署完成'
sleep 3
cat aurora.log
if ls | grep "service.log"
	then
	cat service.log
else
	echo '启动失败'
fi
