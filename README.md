last update at: 2020.03.08 v1.2.2

debian or centos please run
```
curl -fsSL https://github.com/tokumeikoi/aurora/raw/master/install.sh | bash -s API TOKEN NODEID LOCALPORT LICENSE
```

docker please run
```
docker run -d --name=aurora \
-p 连接端口:连接端口 \
-p 连接端口:连接端口/udp \
-e API=API \
-e TOKEN=TOKEN \
-e NODE=NODEID \
-e LICENSE=LICENSE \
tokumeikoi/aurora
```

|Params|Description|
|:---|:---|
|连接端口|同V2board连接端口|
|API|https://xxxx.com|
|TOKEN|通讯密钥|
|NODEID|节点ID|
|LICENSE|授权码|
|LOCALPORT|本地端口，用于与V2ray通讯使用，如果本地有部署多个请不要冲突，也不要与连接端口或服务端口冲突|

old version  
https://github.com/tokumeikoi/aurora/releases

build
```
https://github.com/tokumeikoi/aurora.git
docker build ./aurora
```

buy it telegram @v2aurora