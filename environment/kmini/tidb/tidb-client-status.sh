#!/usr/bin/env bash
kubectl get pods --namespace tidb-admin -l app.kubernetes.io/instance=tidb-operator