#!/bin/bash

export DOMAIN_NAME="coral-k8s.symphony-solutions.eu"
export DOMAIN_NAME_ZONE_ID=$(aws route53 list-hosted-zones | jq -r '.HostedZones[] | select(.Name=="'${DOMAIN_NAME}'.") | .Id' | sed 's/\/hostedzone\///')

export USA_CLUSTER_ALIAS="usa"

export USA_CLUSTER_FULL_NAME="${USA_CLUSTER_ALIAS}.${DOMAIN_NAME}"
export USA_CLUSTER_AWS_REGION="us-east-1"

export USA_CLUSTER_AWS_AZ="us-east-1a"


aws s3api create-bucket --bucket ${USA_CLUSTER_FULL_NAME}-state --region us-east-1


kops create cluster --name=${USA_CLUSTER_FULL_NAME} --zones=${USA_CLUSTER_AWS_AZ} --master-size="t2.medium" --node-size="t2.medium" --node-count="1" --dns-zone=${DOMAIN_NAME} --ssh-public-key="~/.ssh/id_rsa.pub" --state="s3://${USA_CLUSTER_FULL_NAME}-state" --yes


kubectl config set-context ${USA_CLUSTER_ALIAS} --cluster=${USA_CLUSTER_FULL_NAME} --user=${USA_CLUSTER_FULL_NAME}