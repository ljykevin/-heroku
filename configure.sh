#!/bin/sh
# Download and install V2Ray
curl -L -H "Cache-Control: no-cache"   -o /v2ray.zip https://github.com/v2ray/v2ray-core/releases/latest/download/v2ray-linux-64.zip
mkdir /usr/bin/v2ray /etc/v2ray
touch /etc/v2ray/config.json
unzip /v2ray.zip -d /usr/bin/v2ray
# Remove /v2ray.zip and other useless files
rm -rf /v2ray.zip /usr/bin/v2ray/*.sig /usr/bin/v2ray/doc /usr/bin/v2ray/*.json /usr/bin/v2ray/*.dat /usr/bin/v2ray/sys*
# V2Ray new configuration
cat <<-EOF > /etc/v2ray/config.json
{
  "inbounds": [
  {
    "port": ${PORT},
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "${UUID}",
          "alterId": 64
        }
      ]
    },
    "streamSettings": {
      "network": "ws"
    }
  }
  ],
  "outbounds": [
  {
    "protocol": "freedom",
    "settings": {}
  }
  ]
}
EOF
/usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json



##  #!/bin/sh
##  
##  # Download and install V2Ray
##  mkdir /tmp/v2ray
##  wget -q      https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip     -O /tmp/v2ray/v2ray.zip
##  
##  unzip /tmp/v2ray/v2ray.zip -d /tmp/v2ray
##  install -m 755 /tmp/v2ray/v2ray /usr/local/bin/v2ray
##  install -m 755 /tmp/v2ray/v2ctl /usr/local/bin/v2ctl
##  
##  # Remove temporary directory
##  rm -rf /tmp/v2ray
##  
##  # V2Ray new configuration
##  install -d /usr/local/etc/v2ray
##  cat << EOF > /usr/local/etc/v2ray/config.json
##  {
##      "inbounds": [
##          {
##              "port": $PORT,
##              "protocol": "vmess",
##              "settings": {
##                  "clients": [
##                      {
##                          "id": "$UUID",
##                          "alterId": 64
##                      }
##                  ],
##                  "disableInsecureEncryption": true
##              },
##              "streamSettings": {
##                  "network": "ws"
##              }
##          }
##      ],
##      "outbounds": [
##          {
##              "protocol": "freedom"
##          }
##      ]
##  }
##  EOF
##  
##  # Run V2Ray
##  /usr/local/bin/v2ray -config /usr/local/etc/v2ray/config.json
##  
