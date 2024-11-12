Counter-Service App (Python)
Description
This code contains a simple web server that counts the number of POST requests it serves and returns the counter on every GET request it receives.

In order to run it on EKS, first clone and follow instructions of repo: https://github.com/ozblech/devops-infra

Getting Started
Prerequisites:
kubectl


Setup Instructions
Clone the repository:
git clone https://github.com/ozblech/counter-service
cd counter-service
kubectl apply -f counter-service.yaml



