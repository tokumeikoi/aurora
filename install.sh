#!/bin/sh
echo '正在安装依赖'
if cat /etc/os-release | grep "centos" > /dev/null
    then
    yum install unzip wget -y > /dev/null
    yum update curl -y
else
    apt-get install unzip wget -y > /dev/null
    apt-get update curl -y
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
