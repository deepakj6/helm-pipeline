#!/bin/bash
set -e

echo Namespace = "$2"
echo Releasename = "$1"
echo "----------------------Installing pages----------------------------------"


NAMESPACE="$2"
RELEASE_NAME="$1"

kubectl get ns "$NAMESPACE" &> /dev/null || kubectl create ns "$NAMESPACE"

helm upgrade --install "$RELEASE_NAME" pages -n "$NAMESPACE" --debug
helm list
kubectl config current-context
sleep 30s

kubectl get pods -n "$NAMESPACE"


echo "---------------------Completed Installation of pages-------------------"