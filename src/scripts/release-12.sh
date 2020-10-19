#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied. One argument with version is required."
    exit 1
fi

rm -rf /tmp/build
mkdir /tmp/build

cp ../12/* /tmp/build

cd /tmp/build

docker build -t argutec/postgres:12 -t argutec/postgres:12-$1 ./

docker push argutec/postgres:12-$1
docker push argutec/postgres:12