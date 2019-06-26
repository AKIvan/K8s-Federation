#!/bin/bash

kops delete cluster ${USA_CLUSTER_FULL_NAME} --state="s3://${USA_CLUSTER_FULL_NAME}-state" --yes
aws s3api delete-bucket --bucket ${USA_CLUSTER_FULL_NAME}-state