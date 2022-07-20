#!/usr/bin/env bash
kubectl port-forward -n $ZC_TIDB_NS svc/$ZC_TIDB-tidb 4000:4000 > log-tidb-4000.log &
kubectl port-forward -n $ZC_TIDB_NS svc/$ZC_TIDB-monitor-grafana 1202:3000 > log-tidb-pf1202.log &
kubectl port-forward -n $ZC_TIDB_NS svc/$ZC_TIDB-monitor-prometheus 1203:9090 &> log-tidb-pf1203.log &