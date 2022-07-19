#!/usr/bin/env bash
kubectl port-forward -n tidb-cluster svc/basic-tidb 4000:4000 > log-tidb-4000.log &
kubectl port-forward -n tidb-cluster svc/basic-grafana 1202:3000 > log-tidb-pf1202.log &
kubectl port-forward -n tidb-cluster svc/basic-prometheus 1203:9090 &> log-tidb-pf1203.log &