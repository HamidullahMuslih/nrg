# NRG Project: DevSecOps Pipeline

## Introduction
This repo contains all files for the complete CI/CD pipeline for a simple web app project written in Nodejs. 
The tools that are used in this pipeline are as follows:

1. **Jenkins** as CI/CD tool.
2. **Git** as Code repository.
3. **NPM** as package managers.
4. **Junit** (jest) as unit testing tool.
5. **Snyk** as a dependency security scanner.
6. **Docker** engine as container manager.
7. **DockerHub** as docker image registry.
8. **Helm** as package management tool for K8s.
9. **K8s** as a container orchestration tool.


## Flow of the Pipeline

1. **Fetch Code:** Fetching the source code from Github.
2. **Build:** Building the code and downloading the dependencies by npm
3. **Unit Test:** unit testing of the code and the test case is located in app/ folder.
4. **Snyk Scanner:** Scanning all of the downloaded dependencies and triggering job failure if the severity is more than medium.
5. **Building Image:** Docker will build the image. Short build time and the secure image are considered in the dockerfile code.
6. **Deploy Image:** Pushing the image with a specific build tag to DockerHub.
7. **Remove Local Image:** To save space the local image will be deleted.
8. **K8s Deploy:** Deploying the image from DockerHub to K8s cluster using Helm.

**Note**: the service type is Loadbalancer which will be provided by the cloud provider.
