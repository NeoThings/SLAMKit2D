echo  'KERNELS=="1-1.3:1.0", MODE:="0666", GROUP:="dialout", SYMLINK+="imu"' >/etc/udev/rules.d/slamkit2d.rules
echo  'KERNELS=="1-1.2:1.0", MODE:="0666", GROUP:="dialout", SYMLINK+="lidar"' >/etc/udev/rules.d/slamkit2d.rules

service udev reload
sleep 2
service udev restart
