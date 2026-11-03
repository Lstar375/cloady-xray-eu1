FROM alpine:3.20
RUN apk add --no-cache ca-certificates curl unzip
RUN curl -L -o /tmp/Xray-linux-64.zip https://github.com/XTLS/Xray-core/releases/download/v26.10.31/Xray-linux-64.zip \
    && unzip /tmp/Xray-linux-64.zip xray -d /tmp \
    && mv /tmp/xray /usr/local/bin/xray \
    && chmod +x /usr/local/bin/xray \
    && rm -rf /tmp/Xray-linux-64.zip
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 3000
ENTRYPOINT ["/entrypoint.sh"]
