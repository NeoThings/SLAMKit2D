#!/bin/bash

# 使用系统时间生成文件名
timestamp=$(date +"%Y%m%d_%H%M%S")
map_name="map_${timestamp}"

# 如果提供了参数作为目录，使用它；否则使用默认目录
map_dir=${1:-${HOME}/slamkit2d_ws/maps}

mkdir -p "${map_dir}"

# 保存地图，使用时间戳作为文件名
rosrun map_server map_saver --occ 65 --free 25 -f "${map_dir}/${map_name}" map:=/map

echo "地图已保存为: ${map_dir}/${map_name}"