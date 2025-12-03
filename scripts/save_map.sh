#!/bin/bash

# 使用系统时间生成目录名
timestamp=$(date +"%Y%m%d_%H%M%S")

# 如果提供了基础目录，使用它；否则使用默认目录
base_dir=${1:-${HOME}/slamkit2d_ws/maps}
map_dir="${base_dir}/${timestamp}"

# 创建目录（如果不存在）
mkdir -p "${map_dir}"

# 保存地图
rosrun map_server map_saver --occ 65 --free 25 -f "${map_dir}/map" map:=/map

echo "地图已保存到: ${map_dir}/map"