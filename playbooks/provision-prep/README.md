## provision-prep Playbook

Prepare the vagrant box to run Terraform in order to deploy Openshift clusters on vSphere. This includes ChefDK as well as secrets deployed to the environment.

### Requirements

- Ansible 2.4+

### Variables

| Name         | Default value                         |                                                          |
|--------------|---------------------------------------|----------------------------------------------------------|
| chefdk_package_name | chefdk | 
| chefdk_package_state | present |
| chefdk_channel | stable |
| chefdk_version | 3.3.23 |
| chefdk_package_url | `https://packages.chef.io/files/stable/chefdk/{{ chefdk_version }}/{{ ansible_distribution | lower | regex_replace('centos', 'el') }}/{{ ansible_distribution_major_version }}/chefdk-{{ chefdk_version }}-1.{{ ansible_distribution | lower | regex_replace('centos', 'el') }}{{ ansible_distribution_major_version }}.{{ ansible_machine }}.rpm` |
| chef.chef_config.user | chef-sa |
| chef.chef_config.client_key | chef-sa_private.pem |
| chef.chef_config.validation_client_name | utd-validator |
| chef.chef_config.chef_server_url | `https://chef01d.osc.utdlab.com/organizations/utd` |

### Dependancies

### Example

```
$ ansible-playbook ~/openshift-inventory/playbooks/terraform-prep/main.yml -v --ask-vault-pass
```

### Notes

### TODO
- 