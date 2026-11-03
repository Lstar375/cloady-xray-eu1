#!/bin/sh
set -eu
PORT="${PORT:-8080}"
: "${XRAY_UUID:?XRAY_UUID environment variable must be set at deploy time}"
cat > /usr/local/etc/xray/config.json << JSON
{
  "log": {"loglevel": "warning"},
  "inbounds": [{
    "port": $PORT,
    "protocol": "vless",
    "settings": {
      "clients": [{"id": "$XRAY_UUID", "flow": ""}],
      "decryption": "none"
    },
    "streamSettings": {
      "network": "ws",
      "wsSettings": {"path": "/"}
    }
  }],
  "outbounds": [{"protocol": "freedom", "tag": "direct"}]
}
JSON
exec /usr/local/bin/xray run -c /usr/local/etc/xray/config.json
