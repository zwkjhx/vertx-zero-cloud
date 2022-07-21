#!/usr/bin/env bash
kubectl -n $ZC_TIDB_NS delete daemonset zero-cloud-tidb-provisioner
kubectl -n $ZC_TIDB_NS delete configmap zero-cloud-tidb-configuration
kubectl delete storageclass zero-tidb-backup
kubectl delete storageclass zero-tidb-monitoring
kubectl delete storageclass zero-tidb-ssd
kubectl delete storageclass zero-tidb-shared-ssd