

echo "查看进程内存使用情况"
cat /proc/698/status
pmap 99239

echo "查询OOM"
dmesg |grep -E 'kill|oom|out of memory'

echo "free -m  Buffers 是内核缓冲区用到的内存，对应的是 /proc/meminfo 中的 Buffers 值。
Cache 是内核页缓存和 Slab 用到的内存，对应的是 /proc/meminfo 中的 Cached 与 SReclaimable 之和。"

free -m

cat /proc/meminfo | grep Buffers

cat /proc/meminfo | grep -E "SReclaimable|Cached"

echo "清理缓存"
echo 3 > /proc/sys/vm/drop_caches

echo "vmstat "

vmstat 5

echo "查看文件在cache/buffer中情况  https://github.com/tobert/pcstat"