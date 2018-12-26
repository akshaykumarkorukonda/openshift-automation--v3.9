#!/bin/bash

# install prerequistes
yum -y install epel-release
yum install -y git pyOpenSSL python-cryptography python-lxml python2-pip python-jinja2 PyYAML python-paramiko sshpass vim unzip java-1.8.0-openjdk patch httpd-tools
rpm -i https://releases.ansible.com/ansible/rpm/release/epel-7-x86_64/ansible-2.5.6-1.el7.ans.noarch.rpm

# install kubectl
printf "Installing kubectl..."
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.9.10/bin/linux/amd64/kubectl &> /dev/null
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl

# install oc
printf "Installing oc..."
OC="openshift-origin-client-tools-v3.9.0-191fece-linux-64bit"
wget -q https://github.com/openshift/origin/releases/download/v3.9.0/$OC.tar.gz
tar -xzf $OC.tar.gz $OC/oc --strip-components=1
mv ./oc /usr/local/bin/oc
rm -rf $OC.tar.gz

# get openshift-ansible
printf "Fetching openshift-asible..."
git clone https://github.com/openshift/openshift-ansible
chown -R vagrant:vagrant openshift-ansible/
pushd /home/vagrant/openshift-ansible/
git checkout release-3.9
popd

# modify ssh config
cat <<EOF > /home/vagrant/.ssh/config
Host *
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_rsa
EOF

# set env var for ansible
echo "trap 'source ~/.bashrc' DEBUG" >> /home/vagrant/.bashrc
echo "export ANSIBLE_HOST_KEY_CHECKING=False" >> /home/vagrant/.bashrc

printf "Done."