#!/usr/bin/env bash

# требоется уже установленная виртуальня машина с CentOS 7 
# так же требуется пробросить порты у машины TCP/пусто/22/пусто/22
# так же требестся сделать второй сетевой адаптер (Ыиртуальный адаптер хоста)
# так же требуется настроить DNS /etc/sysconfig/network-scripts (ONBOOT=yes DNS1=8.8.8.8)

# список namesspaces - команда kubectl get namespaces
# состояние конкретного namespace - kubectl get namespaces <name>
# описание namespace - kubectl describe namespaces <name>



# echo -n "Введите IP виртуальной машины: "
# read CLIENT_IP
export CLIENT_IP=127.0.0.1
export CLIENT_PORT=2222
export CLIENT_NAME=root
export CLIENT_HOME=/root
scp -P ${CLIENT_PORT} -r ./scripts ${CLIENT_NAME}@${CLIENT_IP}:~/
ssh ${CLIENT_NAME}@${CLIENT_IP} -p ${CLIENT_PORT} sh ${CLIENT_HOME}/scripts/install.sh
