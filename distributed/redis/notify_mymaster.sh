#!/bin/bash  
MASTER_IP=$6
LOCAL_IP='10.33.26.125' # 本机IP
VIP='10.33.26.127'      #虚拟IP, 不能与keepalived中的虚拟IP一致
NETMASK='24'
INTERFACE='eno16777736'          #网卡名称
if [ ${MASTER_IP} = ${LOCAL_IP} ]; then
        /sbin/ip addr add ${VIP}/${NETMASK} dev ${INTERFACE}
        /sbin/arping -q -c 3 -A ${VIP} -I ${INTERFACE}
       exit 0
else
        /sbin/ip addr del ${VIP}/${NETMASK} dev ${INTERFACE}
       exit 0
fi
exit 1
