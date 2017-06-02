#!/bin/bash

CONSUL_HOST="$(docker inspect -f '{{.NetworkSettings.IPAddress}}' node1)"
CONSUL_PORT=8500

docker run -it --rm \
	-e "https_proxy=${https_proxy}" \
	-e "http_proxy=${http_proxy}"   \
	-e "CONSUL_HOST=${CONSUL_HOST}" \
	-e "CONSUL_PORT=${CONSUL_PORT}" \
  panda

