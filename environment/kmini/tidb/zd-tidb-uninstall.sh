#!/usr/bin/env bash
source ../../.env.development
# 1. 删除 ServiceAccount, ClusterRole, ClusterRoleBinding
./ko-tidb-role.sh