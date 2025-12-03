#!/bin/bash

RECORD_PID="/tmp/record_pid"
BAG_NAME="rosbag_$(date +%Y%m%d_%H%M%S)"
TOPICS="/imu_data /odom"

# 检查rosbag是否在运行
recording() {
    if [ -f "$RECORD_PID" ]; then
        PID=$(cat "$RECORD_PID")
        if kill -0 $PID 2>/dev/null; then
            # 检查是否是rosbag进程
            if ps -p $PID -o cmd= | grep -q "rosbag record"; then
                return 0
            fi
        fi
        rm -f "$RECORD_PID"
    fi
    return 1
}

# 主逻辑
if recording; then
    echo "检测到rosbag正在运行,停止录制..."
    PID=$(cat "$RECORD_PID")
    kill -SIGINT $PID
    wait $PID 2>/dev/null
    rm -f "$RECORD_PID"
    echo "录制已停止并保存"
else
    echo "未检测到rosbag录制,开始录制..."
    mkdir -p "${HOME}/slamkit2d_ws/bags"
    rosbag record -O "${HOME}/slamkit2d_ws/bags/$BAG_NAME" $TOPICS &
    ROSBAG_PID=$!
    echo $ROSBAG_PID > "$RECORD_PID"
    echo "录制已启动,PID: $ROSBAG_PID"
    echo "保存到: ${HOME}/slamkit2d_ws/bags/${BAG_NAME}.bag"
fi