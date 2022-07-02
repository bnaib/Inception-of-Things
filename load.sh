if ! [ -d ~/goinfre ]; then
    mkdir ~/goinfre/
    echo 'Created "~/goinfre"'
fi
if ! [ -d ~/goinfre/.vagrant.d ]; then
    mkdir ~/goinfre/.vagrant.d
    echo 'Created "~/goinfre/.vagrant.d"'
fi
if ! [ -d ~/goinfre/VirtualBox\ VMs ]; then
    mkdir ~/goinfre/VirtualBox\ VMs
    echo 'Created "~/goinfre/VirtualBox VMs"'
fi
if ! [ -d ~/goinfre/Images ]; then
    mkdir ~/goinfre/Images
    echo 'Created "~/goinfre/Images"'
fi
if ! [ -f ~/goinfre/Images/centos8.virtualbox ]; then
    echo "Нет файла образа ~/goinfre/Images/centos8.virtualbox"
    echo "Скачайте его по ссылке https://app.vagrantup.com/bento/boxes/centos-8/versions/202112.19.0/providers/virtualbox.box"
    echo "Сохранив как ~/goinfre/Images/centos8.virtualbox"
fi
