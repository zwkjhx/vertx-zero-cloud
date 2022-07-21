#!/usr/bin/env bash
source ../../.env.development
# 1. 创建 ServiceAccount, ClusterRole, ClusterRoleBinding
./ok-tidb-role.sh
# 2. 创建 PVC / StorageClass
./ok-tidb-sc.sh
# 3. 创建 DB / Monitor / Initializer
./ok-tidb-cluster.sh
./ok-tidb-cluster-monitor.sh
./ok-tidb-cluster-init.sh