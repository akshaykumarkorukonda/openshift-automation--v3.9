#!/bin/bash

MANIFEST_PATH=${1:-"/tmp/gap-manifests"}

oc create namespace openshift-monitoring
oc project openshift-monitoring
oc annotate ns/openshift-monitoring openshift.io/node-selector=
oc label ns/openshift-monitoring openshift.io/cluster-monitoring=true

oc apply -f $MANIFEST_PATH/cluster-monitoring-operator-role.yaml
oc apply -f $MANIFEST_PATH/cluster-monitoring-operator-role-binding.yaml
oc apply -f $MANIFEST_PATH/cluster-monitoring-config.yaml
oc apply -f $MANIFEST_PATH/kube-etcd-client-certs.yaml
oc apply -f $MANIFEST_PATH/cluster-monitoring-operator.yaml