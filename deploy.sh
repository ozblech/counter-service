#!/bin/bash

# Ensure the VERSION file exists
if [[ ! -f VERSION ]]; then
  echo "Error: VERSION file not found."
  echo "Please ensure the VERSION file exists in the current directory with the correct version."
  exit 1
fi

# Read the version from the VERSION file
VERSION=$(cat VERSION)

# Validate that the VERSION is not empty
if [[ -z "$VERSION" ]]; then
  echo "Error: VERSION file is empty. Please provide a valid version."
  exit 1
fi
# print the version
echo "Deploying version: $VERSION"

# Define the ECR repository URI
REPOSITORY_URI="881490090336.dkr.ecr.eu-west-3.amazonaws.com/checkpoint-task"

# Create a backup of the original YAML file
cp counter-service.yaml counter-service.yaml.bak

# Update the Kubernetes manifest with the correct image version
sed -i "s|image: .*:.*|image: $REPOSITORY_URI:$VERSION|" counter-service.yaml

# Apply the updated manifest to the Kubernetes cluster
kubectl apply -f counter-service.yaml

# Restore the original YAML file
mv counter-service.yaml.bak counter-service.yaml

# Confirm deployment
echo "Deployment applied with image version: $VERSION"
