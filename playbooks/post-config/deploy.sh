#!/bin/bash

PAYLOAD_PATH=${1:-"/tmp/post-config"}
SECRETS=("reg2-jenkins-agent-secret" "bitbucket-jenkins")

# create jenkins-ci project, ignore if it exists
ns=`/bin/oc get project jenkins-ci --no-headers --output=go-template={{.metadata.name}} 2>/dev/null`
if [ -z "${ns}" ]; then
  echo "Namespace jenkins-ci not found, creating..."
  /bin/oc new-project jenkins-ci
fi

# deploy all manifests in playload dir
/bin/oc create -f $PAYLOAD_PATH || true

# link secrets to builder SA
for SECRET in ${SECRETS[*]}; do
  /bin/oc secrets link -n jenkins-ci builder $SECRET
done

exit 0