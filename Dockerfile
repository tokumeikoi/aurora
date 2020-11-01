FROM alpine:latest

WORKDIR /aurora
RUN cd /aurora \
    && wget https://github.com/tokumeikoi/aurora/releases/latest/download/aurora \
    && wget https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
    && unzip v2ray-linux-64.zip \
    && rm -rf v2ray-linux-64.zip \
    && chmod +x /aurora/*

ENTRYPOINT /aurora/aurora -api="$API" -token="$TOKEN" -node="$NODE" -license="$LICENSE" -syncInterval="$SYNCINTERVAL"
