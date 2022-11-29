# git

## 用户相关

```shell
# global user email
git config --global user.email "975036719@qq.com"
# global username
git config --global user.name "plasticine9750"
# 保存密码
git config --global credential.helper store
```

## 默认分支名

```shell
git config --global init.defaultBranch main
```

## 问题

### 1. gnutls_handshake() failed

git clone 的时候遇到下面的报错

```text
gnutls_handshake() failed: The TLS connection was non-properly terminated.
```

运行 `proxy-utils` 脚本中的 `setGITProxy` 即可

```shell
proxy-utils setGITProxy
```
