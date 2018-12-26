## post-config Playbook

Post deploy configuration tasks for Openshift clusters.

### Requirements

- Ansible 2.4+
- Running Openshift 3.9x cluster
- Access to Ansible Vault password

### Variables

| Name         | Default value                         |                                                          |
|--------------|---------------------------------------|----------------------------------------------------------|
| master_hosts |                                       | Used to get list of Master severs from inv group
| payload_path | "/tmp/post-config"                    | Path of temporary dir for post-config payload

### Dependancies

### Example

```
$ ansible-playbook ~/openshift-inventory/playbooks/post-config/main.yml -i ~/openshift-inventory/inventory/<filename>.ini -u <username> -v -b --ask-vault-pass
```

### Notes
This playbook is not intended as a system for managing secrets or changes to cluster resources. This is only intended to lay down the bare minimum of required permissions and secrets in order for external resources (such as Jenkins) to be able to modify Kubernetes resources.

### TODO
- Break up `main.yml` playbook into separate playbooks.
- Engineer a single jinja2 template for generating multiple secrets