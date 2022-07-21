#!/usr/bin/env bash
kubectl create -f zero-namespace.yml
helm install --namespace $ZC_TIDB_NS tidb-operator pingcap/tidb-operator --version v1.3.6