## Change log

### 0.5.1
- Added inventory for oc4 cluster
  - `inventory/utd-oc4.ini`

### 0.5.0
- Added playbook for deploying GAP stack
  - Includes uninstallation playbook

### 0.4.1
- Updated OC7 inventory to bring in line with OC8
- Fixed `playbooks/post-config/deploy.sh`
  - `set -e` caused exit code evaluation to exit script prematurely.  

### 0.4.0
- Add `terraform` functionality
- Installs Terraform and ChefDK
  - playbooks for populating secrets
    - vCenter service account
    - Chef service account (and certs)
    - root account
    
### 0.3.4
- Patch for `post-config` playbook
  - Corrected format and type for bitbucket secret
  - Playbook has better immutability
  - Added `deploy.sh` to handle payload deployment
    - Added proper secrets linking to service account

### 0.3.3
- Updated OC8 inventory `inventory/utd-oc8.ini`
  - Updated admin password in htpasswd

### 0.3.2
- Updated OC8 inventory `inventory/utd-oc8.ini`
  - Modified internal and public DNS names
  - Increased app node count to `6`
  - Added IP for new app node

### 0.3.1
- Updated OC8 inventory `inventory/utd-oc8.ini`
  - Enabled logging
  - Switched to SDN (ovs)
  - Added HA Proxy configs
  - Added firewall configs

### 0.3.0
- Added `playbooks/` to accommodate Ansible playbooks
  - `post-config` complete dir structure for ansible playbook
    - `files/` contains manifest files that will be deployed
    - `templates/` contains jinja2 templates for all generated manifests
    - `vars/` contains main and secret var files used by Ansible playbook
    - `main.yml` the playbook responsible for the entire deployment process

### 0.2.2
- Added `httpd-tools` to install script
- Updated `README.md` with *Details* section

### 0.2.1
- Added `kubectl` and `oc` tools installation

### 0.2.0
- Created `inventory/archive/` dir for unused inventory files
- Copy only private key (fix for `vagrant ssh` failing to authenticate with key)
- Moved inline scripts to shell script in `scripts/prerequisites.sh`
  - Added env var to disable Ansible host key checking
- Switched to `config.vm.synced_folder` instead of a one-time dir copy of inventory

### 0.1.1
- Added inventory file for test2 cluster with logging enabled
- Added package dependencies for logging installation