#!/bin/sh

echo '正在安装依赖'

if cat /etc/os-release | grep "centos" > /dev/null
    then
    yum update > /dev/null
    yum install tar wget -y > /dev/null
else
    apt update > /dev/null
    apt-get install tar wget -y > /dev/null
fi

domain=$1

cd /tmp
wget https://github.com/go-acme/lego/releases/download/v3.7.0/lego_v3.7.0_linux_amd64.tar.gz

tar zxvf lego_v3.7.0_linux_amd64.tar.gz
chmod 755 *
./lego --email="admin@$domain" --domains="$domain" --http -a run

if ls ./.lego/certificates | grep "$domain"
    then
    echo '证书签发成功'
    mkdir /root/.cert
    cp ./.lego/certificates/$domain.crt /root/.cert/server.crt
    cp ./.lego/certificates/$domain.key /root/.cert/server.key
else
    echo '证书签发失败'
fi