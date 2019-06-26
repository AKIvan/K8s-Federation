#!/bin/bash

kops delete cluster ${EUR_CLUSTER_FULL_NAME} --state="s3://${EUR_CLUSTER_FULL_NAME}-state" --yes
aws s3api delete-bucket --bucket ${EUR_CLUSTER_FULL_NAME}-state