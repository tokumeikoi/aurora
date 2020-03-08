last update at: 2020.03.08 v1.2.2

debian or centos please run
```
curl -fsSL https://github.com/tokumeikoi/aurora/raw/master/install.sh | bash -s api token nodeid localport license
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

|参数名|描述|
|:---|:---|
|连接端口|同V2board连接端口|
|API|https://xxxx.com|
|TOKEN|通讯密钥|
|NODEID|节点ID|
|LICENSE|授权码|

old version  
https://github.com/tokumeikoi/aurora/releases

build
```
https://github.com/tokumeikoi/aurora.git
docker build ./aurora
```

buy it telegram @v2aurora