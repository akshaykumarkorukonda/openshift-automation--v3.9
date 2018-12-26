#!/bin/bash
ASSETS=("prometheus-k8s" "prometheus-operator" "grafana" "cluster-monitoring-operator" "node-exporter" "kube-state-metrics")
CRDS=("alertmanagers.monitoring.coreos.com" "prometheuses.monitoring.coreos.com" "prometheusrules.monitoring.coreos.com" "servicemonitors.monitoring.coreos.com")

oc delete all --all -n openshift-monitoring
oc delete project openshift-monitoring

for CRD in ${CRDS[*]}; do
    oc delete crd $CRD
done

for ASSET in ${ASSETS[*]}; do
    oc delete clusterrolebinding $ASSET
    oc delete clusterrole $ASSET
done

exit 0