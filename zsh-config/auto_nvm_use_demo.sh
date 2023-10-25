#!/bin/zsh

# 指定目录和关联的 Node.js 版本的映射
declare -A target_directories=(
  ["/path/to/target1"]="16"
  ["/path/to/target2"]="14"
  ["/path/to/target3"]="12"
)

# 获取当前 shell 启动目录
current_directory=$(pwd)

# 检查当前目录是否在指定目录映射中
if [[ -v target_directories["$current_directory"] ]]; then
  # 获取关联的 Node.js 版本
  node_version="${target_directories[$current_directory]}"

  # 执行 nvm use 对应的版本
  nvm use "$node_version"
fi
