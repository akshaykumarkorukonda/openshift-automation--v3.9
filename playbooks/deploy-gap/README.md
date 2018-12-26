## deploy-gap Playbook

Playbook for deploying the Openshift cluster monitoring operator.

### Requirements

- Ansible 2.4+
- Running Openshift 3.9x cluster

### Variables

| Name         | Default value                         |                                                          |
|--------------|---------------------------------------|----------------------------------------------------------|
| master_hosts |                                       | Used to get list of Master severs from inv group
| manifest_path | "/tmp/gap-manifests"                 | Path of temporary dir for gap deployment manifests
| baseImage_prometheusOperator | "quay.io/coreos/prometheus-operator" | Base image url |
| baseImage_prometheusK8s | "openshift/prometheus" | Base image url |
| baseImage_alertmanagerMain | "openshift/prometheus-alertmanager" | Base image url |
| baseImage_nodeExporter | "openshift/prometheus-node-exporter" | Base image url |
| baseImage_kubeRbacProxy | "quay.io/coreos/kube-rbac-proxy" | Base image url |
| baseImage_kubeStateMetrics | "quay.io/coreos/kube-state-metrics" | Base image url |
| baseImage_grafana | "grafana/grafana" | Base image url |
| baseImage_auth | "openshift/oauth-proxy" | Base image url |

### Dependancies

### Example

```
$ ansible-playbook ~/openshift-inventory/playbooks/deploy-gap/main.yml -i ~/openshift-inventory/inventory/<filename>.ini -u <username>
```

### Notes

### TODO
- Add mechanism for custom dashboards