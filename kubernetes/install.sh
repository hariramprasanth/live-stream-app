#!/bin/bash

kubectl apply -f live-stream-backend-deployment.yaml
kubectl apply -f istio-gateway.yaml
kubectl apply -f virtual-service.yaml