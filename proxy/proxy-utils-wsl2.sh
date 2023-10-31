#!/bin/bash

# 获取网关 IP
gatewayIP=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')

# 获取主机 IP
hostIP=$(hostname -I | awk '{print $1}')

# 代理 url
PROXY_HTTP="http://${ip}:${port}"
PROXY_HTTPS="http://${ip}:${port}"

# 显示代理信息
function info() {
  echo "ALL_PROXY: ${ALL_PROXY}"
  echo "HTTP_PROXY: ${HTTP_PROXY}"
  echo "HTTPS_PROXY: ${HTTPS_PROXY}"
}

# 设置系统代理
function setSystemProxy() {
  export ALL_PROXY="${PROXY_HTTPS}"
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
  npm config set proxy ${PROXY_HTTP}
  npm config set https-proxy ${PROXY_HTTPS}
}

# 取消 npm 代理
function unsetNPMProxy() {
  npm config delete proxy
  npm config delete https-proxy
}

# 设置 curl 代理
function setCURLProxy() {
  rm -f ~/.curlrc
  echo "-x \"${HTTP_PROXY}\"" > ~/.curlrc
}

# 取消 curl 代理
function unsetCURLProxy() {
  rm -f ~/.curlrc
}

# 设置 apt 代理
function setAPTProxy() {
  sudo rm -rf /etc/apt/apt.conf.d/proxy.conf
  sudo cat > /etc/apt/apt.conf.d/proxy.conf <<- EOF
Acquire::http::Proxy "${PROXY_HTTP}";
Acquire::https::Proxy "${PROXY_HTTP}";
EOF
}

# 取消 apt 代理
function unsetAPTProxy() {
  sudo rm -rf /etc/apt/apt.conf.d/proxy.conf
}

case "$1" in
  "info")
    info
    ;;
  "setSystemProxy")
    setSystemProxy
    ;;
  "unsetSystemProxy")
    unsetSystemProxy
    ;;
  "setGITProxy")
    setGITProxy
    ;;
  "unsetGITProxy")
    unsetGITProxy
    ;;
  "setNPMProxy")
    setNPMProxy
    ;;
  "unsetNPMProxy")
    unsetNPMProxy
    ;;
  "setCURLProxy")
    setCURLProxy
    ;;
  "unsetCURLProxy")
    unsetCURLProxy
    ;;
  "setAPTProxy")
    setAPTProxy
    ;;
  "unsetAPTProxy")
    unsetAPTProxy
    ;;
  *)
    echo "[ERROR]: Invalid arguments!"
    ;;
esac
