# secure-ssh.sh
# author natalie363
# creates a new ssh user using $1 parameter
useradd -m -d /home/$1 -g /bin/bash $1
mkdir /home/$1/.ssh
# adds a public key from the local repo or curled from the remote repo
cd ~/tech-journals
sudo cp SYS265/linux/public-keys/id_rsa.pub /home/$1/.ssh/authorized_keys
sudo chmod 700 /home/$1.ssh
sudo chmod 600 /home/$1/.ssh/authorized_keys
sudo chown -R $1:$1 /home/$1/.ssh
# removes roots ability to ssh in
cat /etc/issue >> $version
if [["$version" == "Ubuntu 20.04.5 LTS \n \l"]]
then  
  echo "This is Ubuntu"
else
  cd /etc/ssh
  sed -i "s/#PermitRootLogin yes/PermitRootLogin no/I" sshd_config
  systemctl restart sshd.service
fi
