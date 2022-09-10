#!/usr/bin/env bash

sed -i '' 's/192.168.56/192.168.42/g' ./Vagrantfile
sed -i '' 's/192.168.56/192.168.42/g' ./scripts/server.sh
