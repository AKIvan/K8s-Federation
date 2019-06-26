# K8s-Federation
Kubernetes Federation

## About
This scripts help you create Kubernetes Cluster on AWS in different regions and then create Federation between clusters.


## Implementation

First you need to configure the AWS Credentials or AWS Variable in the shell where you will execute the scripts. Then start execute the scripts for creating the Clusters in regions. example:
```./K8CUSA.sh``` will create Kubernetes Cluster in USA 'us-east-1' Region.
You must have minimum 2 Clusters in order to Join them in Federations. After You create the cluster you can then execute the ```K8CJoin.sh``` in order to join them in cluster. 

**Note:**
This is old way but usefull in order to start. Its possible that some images during the creation of cluster would not exists or are out of date, but that part is easy to fix. 