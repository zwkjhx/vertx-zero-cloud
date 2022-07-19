#!/usr/bin/env bash
kubectl delete tidbmonitor basic -n zero-cloud-hotel && \
kubectl delete tc basic -n zero-cloud-hotel && \
kubectl delete pvc -n zero-cloud-hotel -l app.kubernetes.io/instance=basic,app.kubernetes.io/managed-by=tidb-operator