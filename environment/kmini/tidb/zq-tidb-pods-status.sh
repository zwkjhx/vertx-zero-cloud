#!/usr/bin/env bash
kubectl get pods --namespace $ZK_NS -l app.kubernetes.io/instance=tidb-operator