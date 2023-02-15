#!/bin/bash
# secure-ssh.sh
# author natalie363
# creates a new ssh user using $1 parameter
sudo useradd -m -d /home/${1} -s /bin/bash ${1}
sudo mkdir /home/${1}/.ssh
# adds a public key from the local repo or curled from the remote repo
cd /home/natalie-adm/tech-journals/
sudo cp sys265/linux/public-keys/id_rsa.pub /home/${1}/.ssh/authorized_keys
sudo chmod 700 /home/${1}/.ssh
sudo chmod 600 /home/${1}/.ssh/authorized_keys
sudo chown -R ${1}:${1} /home/${1}/.ssh
# removes roots ability to ssh in
version=$( cat /etc/issue )
ubuntu="Ubuntu 20.04.5 LTS"
if [[ "$version" == "$ubuntu" ]]; then  
  echo "This is Ubuntu"
else
  cd /etc/ssh
  sed -i "s/#PermitRootLogin yes/PermitRootLogin no/I" sshd_config
  systemctl restart sshd.service
fi
