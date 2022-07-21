#!/usr/bin/env bash
kubectl create secret generic aeon-secret --from-literal=root=pl,okmijn123 --namespace=$ZC_TIDB_NS
kubectl -n $ZC_TIDB_NS apply -f config-tidb-initializer.yaml