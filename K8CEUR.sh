#!/bin/bash

export EUR_CLUSTER_ALIAS="eur"
export EUR_CLUSTER_FULL_NAME="${EUR_CLUSTER_ALIAS}.${DOMAIN_NAME}"
export EUR_CLUSTER_AWS_REGION="eu-west-1"
export EUR_CLUSTER_AWS_AZ="eu-west-1a"

aws s3api create-bucket --bucket ${EUR_CLUSTER_FULL_NAME}-state --region eu-west-1 --create-bucket-configuration LocationConstraint=eu-west-1

kops create cluster --name=${EUR_CLUSTER_FULL_NAME} --zones=${EUR_CLUSTER_AWS_AZ} --master-size="t2.medium" --node-size="t2.medium" --node-count="1" --dns-zone=${DOMAIN_NAME} --ssh-public-key="~/.ssh/id_rsa.pub" --state="s3://${EUR_CLUSTER_FULL_NAME}-state" --yes

kubectl config set-context ${EUR_CLUSTER_ALIAS} --cluster=${EUR_CLUSTER_FULL_NAME} --user=${EUR_CLUSTER_FULL_NAME}