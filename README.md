# cloady-xray-eu1

Cloady EU1 Xray deployment: VLESS + WebSocket, TLS is terminated by the
Cloady platform domain (wildcard cert), so Xray itself listens on plain
WebSocket inside the container.

No secrets are stored in this repo. Set `XRAY_UUID` as an environment
variable / secret at deploy time, and let the platform assign `PORT`.
