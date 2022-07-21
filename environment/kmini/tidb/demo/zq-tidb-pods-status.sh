#!/usr/bin/env bash
kubectl get pods --namespace $ZC_TIDB_NS -l app.kubernetes.io/instance=tidb-operator