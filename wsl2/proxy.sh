#!/bin/bash
hostip=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
wslip=$(hostname -I | awk '{print $1}')
port=7890
PROXY_HTTP="http://${hostip}:${port}"
PROXY_HTTPS="http://${hostip}:${port}"
PROXY_SOCKS="socks5h://${hostip}:${port}"

function show() {
  echo "Host ip: ${hostip}"
  echo "WSL client ip: ${wslip}"
  echo "current ALL_PROXY: ${ALL_PROXY}"
  echo "current HTTP_PROXY: ${HTTP_PROXY}"
  echo "current HTTPS_PROXY: ${HTTPS_PROXY}"
}

function set_proxy() {
  export ALL_PROXY="${PROXY_SOCKS}"
  export HTTP_PROXY="${PROXY_HTTP}"
  export HTTPS_PROXY="${PROXY_HTTP}"
}

function unset_proxy() {
  unset ALL_PROXY 
  unset HTTP_PROXY 
  unset HTTPS_PROXY 
}

function set_git_proxy() {
  git config --global http.proxy "${PROXY_HTTP}"
  git config --global https.proxy "${PROXY_HTTP}"
}

function unset_git_proxy() {
  git config --global --unset http.proxy
  git config --global --unset https.proxy
}

function set_npm_proxy() {
  npm config set proxy ${PROXY_HTTP}
  npm config set http-proxy ${PROXY_HTTP}
  npm config set https-proxy ${PROXY_HTTP}
}

function unset_npm_proxy() {
  npm config delete proxy
  npm config delete http-proxy
  npm config delete https-proxy
}

if [ "$1" = "show" ]; then
  show
elif [ "$1" = "system" ]; then
  set_proxy
elif [ "$1" = "un-system" ]; then
  unset_proxy
elif [ "$1" = "git" ]; then
  set_git_proxy
elif [ "$1" = "un-git" ]; then
  unset_git_proxy
elif [ "$1" = "npm" ]; then
  set_npm_proxy
elif [ "$1" = "un-npm" ]; then
  unset_npm_proxy 
else
  echo "[ERROR]: invalid arguments!"
fi 
