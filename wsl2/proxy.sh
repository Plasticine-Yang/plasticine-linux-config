#!/bin/bash
hostip=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
wslip=$(hostname -I | awk '{print $1}')
port=7890
PROXY_SOCKS="socks5h://${hostip}:${port}"

function display() {
    echo "Host ip: ${hostip}"
    echo "WSL client ip: ${wslip}"
    echo "current ALL_PROXY: ${ALL_PROXY}"
}

function set_proxy() {
    export ALL_PROXY="${PROXY_SOCKS}"
    echo "ALL_PROXY has been set."
}

function unset_proxy() {
    unset ALL_PROXY 
    echo "env proxy unset."
}

function set_git_proxy() {
    git config --global http.proxy "${PROXY_SOCKS}"
    git config --global https.proxy "${PROXY_SOCKS}"
    echo "set: git config --global http.proxy ${PROXY_SOCKS}"
    echo "set: git config --global https.proxy ${PROXY_SOCKS}"
}

function unset_git_proxy() {
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    echo "set: git config --global --unset http.proxy ${PROXY_SOCKS}"
    echo "set: git config --global --unset https.proxy ${PROXY_SOCKS}"
}

if [ "$1" = "display" ]; then
    display
elif [ "$1" = "set" ]; then
    set_proxy
elif [ "$1" = "unset" ]; then
    unset_proxy
elif [ "$1" = "setgit" ]; then
    set_git_proxy
elif [ "$1" = "ungit" ]; then
    unset_git_proxy
else
    echo "incorrect arguments."
fi 
