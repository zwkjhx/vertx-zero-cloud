#!/usr/bin/env bash
source ../../.env.development
# 1. 创建 ServiceAccount, ClusterRole, ClusterRoleBinding
./ok-tidb-role.sh
# 2. 创建 PVC / StorageClass
./ok-tidb-sc.sh