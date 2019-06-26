#!/bin/bash

export JPN_CLUSTER_ALIAS="jpn"
export JPN_CLUSTER_FULL_NAME="${JPN_CLUSTER_ALIAS}.${DOMAIN_NAME}"
export JPN_CLUSTER_AWS_REGION="ap-northeast-1"
export JPN_CLUSTER_AWS_AZ="ap-northeast-1a"


aws s3api create-bucket --bucket ${JPN_CLUSTER_FULL_NAME}-state --region ap-northeast-1 --create-bucket-configuration LocationConstraint=ap-northeast-1


kops create cluster --name=${JPN_CLUSTER_FULL_NAME} --zones=${JPN_CLUSTER_AWS_AZ} --master-size="t2.medium" --node-size="t2.medium" --node-count="1" --dns-zone=${DOMAIN_NAME} --ssh-public-key="~/.ssh/id_rsa.pub" --state="s3://${JPN_CLUSTER_FULL_NAME}-state" --yes


kubectl config set-context ${JPN_CLUSTER_ALIAS} --cluster=${JPN_CLUSTER_FULL_NAME} --user=${JPN_CLUSTER_FULL_NAME}