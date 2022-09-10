#!/usr/bin/env bash

# требуется уже установленная виртуальня машина с CentOS 7 
# https://mirror.yandex.ru/centos/7/isos/x86_64/
# так же требестся сделать второй сетевой адаптер (Виртуальный адаптер хоста)
# так же требуется настроить /etc/sysconfig/network-scripts/ifcfg-enp0s8 (ONBOOT=yes DNS1=8.8.8.8)

echo "Введите IP виртуальной машины: "
read CLIENT_IP
export CLIENT_PORT=22
export CLIENT_NAME=root
export CLIENT_HOME=/root
scp -P ${CLIENT_PORT} -r ./scripts ${CLIENT_NAME}@${CLIENT_IP}:~/
ssh ${CLIENT_NAME}@${CLIENT_IP} -p ${CLIENT_PORT} sh ${CLIENT_HOME}/scripts/install.sh
