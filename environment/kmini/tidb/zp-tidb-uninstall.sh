#!/usr/bin/env bash
kubectl delete tidbmonitor $ZC_TIDB -n $ZC_TIDB_NS
kubectl delete tc $ZC_TIDB -n $ZC_TIDB_NS
kubectl delete tidbinitializer $ZC_TIDB-initializer -n $ZC_TIDB_NS
kubectl delete pvc -n $ZC_TIDB_NS -l app.kubernetes.io/instance=$ZC_TIDB,app.kubernetes.io/managed-by=tidb-operator