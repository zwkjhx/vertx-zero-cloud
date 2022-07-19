#!/usr/bin/env bash
kubectl delete tidbmonitor $ZC_TIDB_NAME -n $ZC_NS && \
kubectl delete tc $ZC_TIDB_NAME -n $ZC_NS && \
kubectl delete pvc -n $ZC_NS -l app.kubernetes.io/instance=$ZC_TIDB_NAME,app.kubernetes.io/managed-by=tidb-operator