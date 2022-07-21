#!/usr/bin/env bash
source ../../.env.development
# 1. 删除 ServiceAccount, ClusterRole, ClusterRoleBinding
./ko-tidb-role.sh
# 2. 删除 PVC / StorageClass
./ko-tidb-sc.sh
# 3. 删除 Cluster
./ko-tidb-cluster.sh