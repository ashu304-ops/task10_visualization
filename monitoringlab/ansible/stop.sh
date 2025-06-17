#!/bin/bash

docker stop grafana
docker rm grafana

docker stop node_exporter_1
docker rm node_exporter_1

docker stop node_exporter_2
docker rm node_exporter_2

docker stop prometheus
docker rm prometheus
