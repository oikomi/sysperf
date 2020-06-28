#!/usr/bin/env bash

FENGE() {
  echo "##################################"
  echo "##################################"
}

mpstat_path=`which mpstat`
echo "mpstat_path: ${mpstat_path}"
if [ "${mpstat_path}" = "" ]; then
  yum install sysstat -y
fi

FENGE
echo "step1 : check sys cpu info"
echo "check usr/sys/iowait"
mpstat -P ALL


FENGE
echo "step2 : check process cpu info"
echo "check usr/system/iowait, 注意低版本pidstat没有iowait选项"
pidstat -u


FENGE
echo "step3 : 系统的上下文切换情况(整体)"
echo "
cs(context switch)是每秒上下文切换的次数
in(interrupt)则是每秒中断的次数
r(Running or Runnable)是就绪队列的长度，也就是正在运行和等待 CPU 的进程数
b(Blocked)则是处于不可中断睡眠状态的进程数
"
vmstat 5 5

FENGE
echo "step4 : 进程的上下文切换情况"
echo "
cswch ，表示每秒自愿上下文切换 (voluntary context switches)的次数，
另一个则是 nvcswch ，表示每秒非自愿上下文切换(non voluntary context switches)的次数。
这两个概念你一定要牢牢记住，因为它们意味着不同的性能问题:
所谓自愿上下文切换，是指进程无法获取所需资源，导致的上下文切换。比如说， I/O、 内存等系统资源不足时，就会发生自愿上下文切换。
而非自愿上下文切换，则是指进程由于时间片已到等原因，被系统强制调度，进而发生的上下文切换。比如说，大量进程都在争抢 CPU 时，就容易发生非自愿上下文切换。"
pidstat -wt 5 2


