# DevOps Project: CI/CD Pipeline Deployment

## Overview
This project sets up a CI/CD pipeline for deploying a web application on a Kubernetes cluster using Jenkins, Ansible, and Docker.

## Prerequisites
- **EC2 Instances**:
  1. Jenkins (t2.micro)
  2. Ansible (t2.micro)
  3. Webapp (Kubernetes cluster, t2.medium)
- **Software**: Git, Linux, Jenkins, Docker, Docker Hub Account, Ansible, Kubernetes

## Setup Instructions

### 1. EC2 Instance Setup
- Launch 3 EC2 instances (Jenkins, Ansible, Kubernetes).
- Connect to each instance and install the necessary software.

### 2. Install Jenkins
```bash
sudo apt-get update
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins


* Access Jenkins at http://<Jenkins-Instance-IP>:8080 with username Archana and password uniphore@123.

**3. Install Ansible and Docker on Ansible Server**

     sudo apt-get update
     sudo apt install ansible
     sudo apt install docker.io

**4. Install Minikube and Docker on Kubernetes Server **

    sudo apt update
    sudo apt install -y curl apt-transport-https virtualbox
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
    minikube start --driver=virtualbox

**5. Configure Jenkins**

   Create a new pipeline project in Jenkins.
   Add your GitHub repository details and create a pipeline script to build your Docker image.

**6. Set Up Webhook**

   In your GitHub repository, navigate to Settings > Webhooks and add your Jenkins URL to trigger builds on code commits.

**7. Build Docker Image**

   docker build -t $JOB_NAME:v1.$BUILD_ID .
   docker image tag $JOB_NAME:v1.$BUILD_ID archu707/$JOB_NAME:v1.$BUILD_ID

**8. Push Image to Docker Hub**

   Log in to Docker Hub and push the Docker image.

**10. Deploy on Kubernetes**

   Set up passwordless SSH from Ansible to Kubernetes server.
   Use Ansible playbooks to deploy your application on the Kubernetes cluster.




