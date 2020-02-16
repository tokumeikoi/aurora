debian or centos please run
```
curl -fsSL https://github.com/deepbwork/v2board-server/raw/master/install.sh | bash -s websiteurl token nodeid localport license
```

docker please run
```
docker run -d --name=v2board-server \
-p 连接端口:连接端口 \
-p 连接端口:连接端口/udp \
-e API=API \
-e TOKEN=TOKEN \
-e NODE=NODEID \
-e LICENSE=LICENSE \
tokumeikoi/v2board-server
```

build
```
https://github.com/deepbwork/v2board-server.git
docker build ./v2board-server
```