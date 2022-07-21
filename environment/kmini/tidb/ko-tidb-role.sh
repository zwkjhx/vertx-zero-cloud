#!/usr/bin/env bash
kubectl -n $ZC_TIDB_NS delete serviceaccount zero-cloud-tidb-admin
kubectl delete clusterrolebinding zero-cloud-tidb-pv-binding
kubectl delete clusterrolebinding zero-cloud-tidb-node-binding
kubectl delete clusterrole zero-cloud-tidb-clusterrole