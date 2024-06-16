#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT

echo "Logging into Tanzu Platform"
export TANZU_API_TOKEN=$1 # tanzu_api_token
tanzu login

echo "Logging into container registry"
docker login $2 -u $3 -p $4 # repository, username, password
echo "Configuring build plan"
tanzu build config --build-plan-source-type=ucp --containerapp-registry $5 # container_registry

echo "Setting project and space context"
tanzu project use $6
tanzu space use $7