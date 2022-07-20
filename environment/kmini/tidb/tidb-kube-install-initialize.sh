#!/usr/bin/env bash
kubectl create secret generic aeon-secret --from-literal=root=pl,okmijn123 --namespace=$ZK_NS
kubectl -n $ZK_NS apply -f config-tidb-initialize.yaml