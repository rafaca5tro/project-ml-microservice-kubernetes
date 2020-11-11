#!/usr/bin/env bash

dockerpath="vonbolan/mlapi"

# Run in Docker Hub container with kubernetes
#kubectl run \
    #--generator=run-pod/v1 mlmicroservicesapi\
    #--image=$dockerpath\
    #--port=80 --labels app=mlmicroservicesapi
kubectl run --generator=run-pod/v1 mlmicroservicesapi --image=$dockerpath
#kubectl run --generator=run-pod/v1 mlmicroservicesapi --image=vonbolan/mlapi

# List kubernetes pods
kubectl get pods

# Forward the container port to host
kubectl port-forward mlmicroservicesapi 8000:80
