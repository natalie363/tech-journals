# secure-ssh.sh
# author natalie363
# creates a new ssh user using $1 parameter
# adds a public key from the local repo or curled from the remote repo
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
