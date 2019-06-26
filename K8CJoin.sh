#!/bin/bash

export FEDERATION_NAME="fed"
kubectl config use-context ${USA_CLUSTER_ALIAS}

kubefed init ${FEDERATION_NAME} --host-cluster-context=${USA_CLUSTER_ALIAS} --dns-provider=aws-route53 --dns-zone-name=${DOMAIN_NAME} --image='edwardspc/fcp-amd64:v1.9.0-alpha'


kubectl config use-context ${FEDERATION_NAME}


kubefed join ${USA_CLUSTER_ALIAS} --host-cluster-context=${USA_CLUSTER_ALIAS} --cluster-context=${USA_CLUSTER_ALIAS}
kubefed join ${EUR_CLUSTER_ALIAS} --host-cluster-context=${USA_CLUSTER_ALIAS} --cluster-context=${EUR_CLUSTER_ALIAS}
kubefed join ${JPN_CLUSTER_ALIAS} --host-cluster-context=${USA_CLUSTER_ALIAS} --cluster-context=${JPN_CLUSTER_ALIAS}