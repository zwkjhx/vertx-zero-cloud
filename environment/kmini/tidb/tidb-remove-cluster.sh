#!/usr/bin/env bash
kubectl delete tidbmonitor $ZC_TIDB-monitor -n $ZK_NS
kubectl delete tc $ZC_TIDB -n $ZK_NS
kubectl delete tidbinitializer $ZC_TIDB-initializer -n $ZK_NS
kubectl delete pvc -n $ZK_NS -l app.kubernetes.io/instance=$ZC_TIDB,app.kubernetes.io/managed-by=tidb-operator