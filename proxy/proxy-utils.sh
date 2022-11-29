#!/bin/bash

# 获取网关 IP
gatewayIP=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')

# 获取主机 IP
hostIP=$(hostname -I | awk '{print $1}')

# 代理服务器端口
port=7890

# 代理 url
PROXY_HTTP="http://${gatewayIP}:${port}"
PROXY_HTTPS="https://${gatewayIP}:${port}"
PROXY_SOCKS="socks5h://${gatewayIP}:${port}"

# 显示代理信息
function info() {
  echo "gatewayIP: ${gatewayIP}"
  echo "hostIP: ${hostIP}"
  echo "ALL_PROXY: ${ALL_PROXY}"
  echo "HTTP_PROXY: ${HTTP_PROXY}"
  echo "HTTPS_PROXY: ${HTTPS_PROXY}"
}

# 设置系统代理
function setSystemProxy() {
  export ALL_PROXY="${PROXY_SOCKS}"
  export HTTP_PROXY="${PROXY_HTTP}"
  export HTTPS_PROXY="${PROXY_HTTPS}"
}

# 取消系统代理
function unsetSystemProxy() {
  unset ALL_PROXY 
  unset HTTP_PROXY 
  unset HTTPS_PROXY 
}

# 设置 git 代理
function setGITProxy() {
  git config --global http.proxy "${PROXY_HTTP}"
  git config --global https.proxy "${PROXY_HTTPS}"
}

# 取消 git 代理
function unsetGITProxy() {
  git config --global --unset http.proxy
  git config --global --unset https.proxy
}

# 设置 npm 代理
function setNPMProxy() {
  npm config set http-proxy ${PROXY_HTTP}
  npm config set https-proxy ${PROXY_HTTPS}
}

# 取消 npm 代理
function unSetNPMProxy() {
  npm config delete http-proxy
  npm config delete https-proxy
}

# 设置 curl 代理
function setCURLProxy() {
  rm -f ~/.curlrc
  touch ~/.curlrc
  echo "socks5=\"${PROXY_SOCKS}\"" > ~/.curlrc
}

# 取消 curl 代理
function unsetCURLProxy() {
  rm -f ~/.curlrc
}

if [ "$1" = "info" ]; then
  info
elif [ "$1" = "setSystemProxy" ]; then
  setSystemProxy
elif [ "$1" = "unsetSystemProxy" ]; then
  unsetSystemProxy
elif [ "$1" = "setGITProxy" ]; then
  setGITProxy
elif [ "$1" = "unsetGITProxy" ]; then
  unsetGITProxy
elif [ "$1" = "setNPMProxy" ]; then
  setNPMProxy
elif [ "$1" = "unSetNPMProxy" ]; then
  unSetNPMProxy 
elif [ "$1" = "setCURLProxy" ]; then
  setCURLProxy 
elif [ "$1" = "unsetCURLProxy" ]; then
  unsetCURLProxy 
else
  echo "[ERROR]: invalid arguments!"
fi 
