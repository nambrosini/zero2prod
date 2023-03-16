#!/bin/zsh

OLD_VERSION=0.1.0
NEW_VERSION=0.1.0
APP_NAME=zero2prod

# Replace version in files
sed -i '' -e "s/${OLD_VERSION}/${NEW_VERSION}/g" charts/$APP_NAME/Chart.yaml
sed -i '' -e "s/${OLD_VERSION}/${NEW_VERSION}/g" build_push_docker.sh

podman build --arch amd64 -t docker.io/nambrosini/$APP_NAME:$NEW_VERSION .
podman push docker.io/nambrosini/$APP_NAME:$NEW_VERSION
helm upgrade $APP_NAME --namespace zero2prod --values charts/$APP_NAME/values.yaml charts/$APP_NAME/
