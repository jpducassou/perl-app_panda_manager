#!/bin/bash

curl -X PUT --data-binary @panda_service.json http://localhost:8500/v1/agent/service/register

