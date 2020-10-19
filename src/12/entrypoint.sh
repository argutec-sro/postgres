#!/bin/bash

mkdir -p /root
mkdir -p /root/.ssh
cp -R /ssh/* /root/.ssh/
chmod 700 /root/.ssh
# chmod 644 /root/.ssh/id_rsa.pub
# chmod 600 /root/.ssh/id_rsa
chmod 600 /root/.ssh/authorized_keys

#su - postgres -c "cp -R /ssh/* ~postgres/.ssh/ && chmod 700 ~postgres/.ssh && chmod 644 ~postgres/.ssh/id_rsa.pub && chmod 600 ~postgres/.ssh/id_rsa && chmod 600 ~postgres/.ssh/authorized_keys"

/usr/sbin/sshd 2>&1

exec /usr/local/bin/docker-entrypoint.sh "$@"