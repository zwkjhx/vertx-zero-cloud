#!/usr/bin/env bash
kubectl create secret generic zero-tidb-secret --from-literal="root=pl,okmijn123" --namespace=$ZC_TIDB
kubectl -n $ZC_TIDB apply -f zero-tidb-cluster-init.yml