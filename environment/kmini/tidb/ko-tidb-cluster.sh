#!/usr/bin/env bash
kubectl delete -n $ZC_TIDB secret zero-tidb-secret
kubectl delete tc $ZC_TIDB -n $ZC_TIDB
kubectl delete tidbmonitor $ZC_TIDB -n $ZC_TIDB
kubectl delete tidbinitializer $ZC_TIDB-initializer -n $ZC_TIDB
kubectl delete pvc -n $ZC_TIDB -l app.kubernetes.io/instance=$ZC_TIDB,app.kubernetes.io/managed-by=tidb-operator