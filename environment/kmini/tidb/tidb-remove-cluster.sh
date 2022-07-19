#!/usr/bin/env bash
kubectl delete tc basic -n tidb-cluster && \
kubectl delete pvc -n tidb-cluster -l app.kubernetes.io/instance=basic,app.kubernetes.io/managed-by=tidb-operator