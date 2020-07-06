<img src='https://github.com/tokumeikoi/tidalab-trojan/raw/master/img/tidalab.png' width='100px' align='center'>

## 快速使用

1.在系统中运行
```bash
# 使用必读
# 使用前请在V2Board添加好节点
# 请将命令中的API替换成V2board面板地址如：https://v2board.com
# 请将命令中的TOKEN替换成V2Board后台系统配置->服务端->通讯密钥
# 请将命令中的NODEID替换成V2Board后台V2ray中添加的节点ID
# 请将命令中的LOCALPORT替换成1-65535任意端口不允许与其他端口冲突，非连接端口和服务端口
# 请将命令中的LICENSE替换成授权字符

curl -fsSL https://github.com/tokumeikoi/aurora/raw/master/install.sh | bash -s API TOKEN NODEID LOCALPORT LICENSE 60
```

2.在Docker运行
```bash
# 使用必读
# 使用前请在V2Board添加好节点
# 请将命令中的服务端口替换成V2board节点配置中服务端口
# 请将命令中的API替换成V2board面板地址如：https://v2board.com
# 请将命令中的TOKEN替换成V2Board后台系统配置->服务端->通讯密钥
# 请将命令中的NODEID替换成V2Board后台V2ray中添加的节点ID
# 请将命令中的LICENSE替换成授权字符

Docker run -d --name=aurora \
-p 服务端口:服务端口 \
-p 服务端口:服务端口/udp \
-e API=API \
-e TOKEN=TOKEN \
-e NODE=NODEID \
-e LICENSE=LICENSE \
-e SYNCINTERVAL=60 \
tokumeikoi/aurora
```

## 申请TLS证书

1.首先将节点域名解析到节点服务器，并且可以ping通  

```bash
# 使用必读
# 使用前请将节点域名解析到节点，并且可以ping通
# 请将命令中的domain.com替换成节点域名
curl -fsSL https://github.com/tokumeikoi/aurora/raw/master/sign.sh | bash -s domain.com
```

2.申请完成后证书将会保存至/root/.cert/server.crt /root/.cert/server.key