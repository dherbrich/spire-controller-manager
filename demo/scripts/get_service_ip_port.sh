#!/bin/bash

set -e -o pipefail

NAMESPACE="$1"
NAME="$2"
## this varies a lot between clouds
NODEPORT=$(kubectl get "service/$NAME" "-n$NAMESPACE" -o jsonpath='{.spec.ports[0].port}')
NODEIP=$(kubectl get "service/$NAME" "-n$NAMESPACE" -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

echo "$NODEIP:$NODEPORT"
