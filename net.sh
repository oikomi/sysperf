
echo "step 1 : 整体查看"

echo "查询网卡带宽"
ethtool bond0 | grep Speed

netstat -s

echo "step 2 : sar -n DEV 1
给 sar 增加 -n 参数就可以查看网络的统计信息，比如网络接口(DEV)、网络接口错误 (EDEV)、TCP、UDP、ICMP 等等。
rxpck/s 和 txpck/s 分别是接收和发送的 PPS，单位为包 / 秒。
rxkB/s 和 txkB/s 分别是接收和发送的吞吐量，单位是 KB/ 秒。
rxcmp/s 和 txcmp/s 分别是接收和发送的压缩数据包数，单位是包 / 秒。
%ifutil 是网络接口的使用率，即半双工模式下为 (rxkB/s+txkB/s)/Bandwidth，而全双 工模式下为 max(rxkB/s, txkB/s)/Bandwidth。
"

sar -n DEV 1

nethogs
iftop -n
echo "yum install iptraf -y"
iptraf-ng

