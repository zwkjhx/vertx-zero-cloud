#!/usr/bin/env bash
kubectl delete -f config-namespace.yml
kubectl create -f config-namespace.yml