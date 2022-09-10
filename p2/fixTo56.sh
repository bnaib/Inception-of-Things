#!/usr/bin/env bash

sed -i '' 's/192.168.42/192.168.56/g' ./Vagrantfile
sed -i '' 's/192.168.42/192.168.56/g' ./scripts/server.sh
