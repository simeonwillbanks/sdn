#!/bin/bash

# Usage: ./useradd.sh [host]

host="${1:-root@64.34.219.4}"

# The host key might change when we instantiate a new VM, so
# we remove (-R) the old host key from known_hosts
ssh-keygen -R "${host#*@}" 2> /dev/null

ssh -o 'StrictHostKeyChecking no' "$host" '
groupadd deployers &&
groupadd simeon &&
useradd -m -g staff -G deployers,simeon -s /bin/bash simeon &&
echo "%deployers ALL = NOPASSWD: ALL" >> /etc/sudoers &&
mkdir /home/simeon/.ssh &&
touch /home/simeon/.ssh/authorized_keys &&
touch /home/simeon/.ssh/environment &&
sed "s/#AuthorizedKeysFile/AuthorizedKeysFile/" /etc/ssh/sshd_config &&
echo "PermitUserEnvironment yes" >> /etc/ssh/sshd_config &&
/etc/init.d/ssh restart'

scp ~/.ssh/id_rsa.pub $host:/home/simeon/.ssh/authorized_keys

ssh -o 'StrictHostKeyChecking no' "$host" '
chown -R simeon:simeon /home/simeon/.ssh &&
chmod 700 /home/simeon/.ssh &&
chmod 600 /home/simeon/.ssh/authorized_keys
chmod 600 /home/simeon/.ssh/environment'
