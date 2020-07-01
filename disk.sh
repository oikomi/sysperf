

echo "查看索引节点使用情况"

df -i /dev/sda1

echo "查看页缓存， free 输出的 Cache，是页缓存和可回收 Slab 缓存的和"
free -m
cat /proc/meminfo | grep -E "SReclaimable|Cached"

echo "查看目录项缓存,下面命令可以获取所有目录项和各种文件系统索引节点的缓存情况，最简单是用slabtop"

cat /proc/slabinfo | grep -E '^#|dentry|inode'

slabtop

echo "查看disk情况 /proc/diskstats 、iostat、iotop"

cat /proc/diskstats

iostat -x -d 5

iotop

echo "用vmstat查一下"

vmstat 5 5

echo "找进程"
pidstat -d 5

echo "查看进程在干嘛  "
strace -p 18940
lsof -p 18940

echo "blktrace 块设备IO事件跟踪"

blktrace -d /dev/vda5 -o- | blkparse -i-

echo "下面是优化"
echo "改IO调度算法/sys/block/{DEVICE-NAME}/queue/scheduler"



