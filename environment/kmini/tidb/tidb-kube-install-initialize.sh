#!/usr/bin/env bash
kubectl create secret generic aeon-secret --from-literal=root=pl,okmijn123 --namespace=$ZC_NS
kubectl -n $ZC_NS apply -f config-tidb-initialize.yaml