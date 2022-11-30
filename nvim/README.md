# neovim

## 入口文件

```text
~/.config/nvim/init.lua
```

## 模块加载机制

默认是加载 `runtimepath` 中的 lua 目录下的 lua 文件

在 nvim 中 `runtimepath` 就是 `~/.config/nvim/`

## 基础配置

- vim.g.{name}: 全局变量
- vim.b.{name}: 缓冲区变量
- vim.w.{name}: 窗口变量
- vim.bo.{option}: buffer-local 选项
- vim.wo.{option}: window-local 选项

## 插件管理

需要安装 [packer.nvim](https://github.com/wbthomason/packer.nvim#quickstart)

```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

插件安装目录

```text
~/.local/share/nvim/site/pack/packer/start
```
