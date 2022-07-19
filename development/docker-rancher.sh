#!/usr/bin/env bash
docker run --name="zero-cloud-rancher" -d --restart=unless-stopped -p 1202:8080 rancher/server