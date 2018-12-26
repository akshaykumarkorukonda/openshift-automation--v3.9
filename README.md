# openshift-inventory
This project is intended to track all configurations related to the public openshift-ansible (origin) project. The project also contains Ansible playbooks and a "run anywhere" Vagrant workstation that can be used to provision and deploy Openshift clusters.

## References
- https://github.com/openshift/openshift-ansible
- https://docs.openshift.org/3.9/install_config/install/advanced_install.html

## Requirements
- Vagrant `2.x` and up
- VirtualBox `5.2.x` (see Vagrant compatibility)
- ssh private key at `~/.ssh/id_rsa` (see [Operation](###Operation) section)

## Details
This repo contains a Vagrantfile that will deploy a Vagrant box VM on a workstation using VirtualBox as the default provider. Details of the installed packages can be found in `scripts/prerequisites.sh`.

This repo also contains a `playbooks/` dir that houses Ansible playbooks. This may move to a dedicated repository in the future. See the `README.md` file included with each playbook on how it functions.

#### Playbooks
- `post-config` - applies a CE base configuration to a running Openshift cluster
- `provision-prep` - prepares the Vagrant workstation to run Terraform

#### Operation
The Vagrant box is intended to be a "run anywhere" workstation that always has the required packages and versions to provision and deploy an Openshift cluster.

When the Vagrant box is brought online it will; copy your private `id_rsa` into the box, install the required packages, fetch the `openshift-ansible` git project, checkout `release-3.9` branch, modify the `.ssh/confg` file, add Ansible environment variables, then mount the `openshift-inventory/` project into the VM.

#### Packages:

- Ansible `2.5.6-1` (latest build in `2.5.x` version required by `openshift-ansible`)
  - pyOpenSSL
  - python-cryptography
  - python-lxml
  - java-1.8.0-openjdk
  - patch
  - httpd-tools
- kubectl `v1.9.10`
- oc `v3.9.0`

## Usage
1. Clone this project
1. Deploy the Vagrant box:
    ```
    $ vagrant up
    ```
1. Login to Vagrant box:
    ```
    $ vagrant ssh
    ```

From here you can either run Terraform to provision a new cluster with [Terraform](###Terraform-Provisioning) or you can run the Openshift [deployment](###Openshift-Deployment) to install Openshift on an existing set of VMs.

### Terraform Provisioning
In order to provision VMs via Terraform using this Vagrant box, you must run the following playbook to load in the needed secrets and environment variables. You must enter the password to read secrets from the Ansible Vault.

```
$ ansible-playbook openshift-inventory/playbooks/provision-prep/main.yml -v --ask-vault-pass
```

### Openshift Deployment
1. Validate the inventory file is in place
1. Eval and add your ssh key:
    ```
    $ eval `ssh-agent`; ssh-add
    ```
1. Reference the desired inventory files and config files in this project when you run Ansible:

    ```
    $ ansible-playbook ~/openshift-ansible/playbooks/prerequisites.yml -i ~/openshift-inventory/inventory/<filename>.ini -u <username> -v -b
    $ ansible-playbook ~/openshift-ansible/playbooks/deploy_cluster.yml -i ~/openshift-inventory/inventory/<filename>.ini -u <username> -v -b
    $ ansible-playbook ~/openshift-inventory/playbooks/post-config/main.yml -i ~/openshift-inventory/inventory/<filename>.ini -u <username> -v -b --ask-vault-pass
    ```

## TODO
- Add tasks to `post-config` playbook:
  - Mark master servers as _not_ schedulable
