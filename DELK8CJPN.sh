#!/bin/bash

kops delete cluster ${JPN_CLUSTER_FULL_NAME} --state="s3://${JPN_CLUSTER_FULL_NAME}-state" --yes
aws s3api delete-bucket --bucket ${JPN_CLUSTER_FULL_NAME}-state