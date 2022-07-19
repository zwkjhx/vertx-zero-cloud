#!/usr/bin/env bash
kubectl create namespace tidb-cluster && \
kubectl -n tidb-cluster apply -f config-tidb-cluster.yaml