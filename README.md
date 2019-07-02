# Setup Automated CI/CD Pipeline

## Assumptions
* Infrastructure provisioning is not a part of this setup. Resources like VPC, Subnets, EC2 machines should be provisioned in advance. In this setup both the machines are using Ubuntu operating system. 
* One EC2 machine should be used to install CI/CD components like Jenkins, Nexus, Sonarqube etc. 
* Second machine should be used to deploy application.

## Pre-requisites
* [Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/) and [docker-compose](https://docs.docker.com/compose/install/) should be pre installed in machine which will run all the CI/CD componets.
* Java should be installed in the target machine, where application will be deployed. 

## CI/CD Componets Installation
* Push the zip file to the machine, where you want to deploy the CI/CD components. 
* SSH into the machine and unzip the file. Go to the root folder and run `docker-compose up -d` command to deploy all the components as a docker container. 
* Run `docker ps` command to ensure all the components are up and running. At this stage we have all the componets installed and now we are ready to configure each component. 

## Jenkins Configuration
* Jenkins installation is pre-configured to skip initial wizard, creating first admin user and all the required plugin installations. So we don't need to perform manual steps for initial setup. 
* Jenkins is accessible on 8080 port of your host machine IP. 
* To build and test java code using maven we need to configure maven and java tools in `Global Tool configuration section`.
* Create credential in `Credentials section` to pull the code from private repo.
* Create credential using SSH private key to remotely execute the shell command in deploy stage. 
* CI/CD pipeline is defined in a Jenkinsfile in the project root folder. 

## SonarQube Configuration
* To configure sonarqube server first we need to login into the sonarqube and generate the security token. 
* Also, we need to configure a webhook in sonarqube console for Quality Gate.
* Once this is done, sonarqube server configuration is done in Jenkins under `SonarQube servers` section, where you need to provide details like Name, Server Url, and server authentication token etc.

## Nexus Configuration
* Nexus configuration is done is Jenkinsfile as a part of CI/CD pipeline. 
* A hosted maven repository is created in Nexus to store the artifacts. 

## Deploy
* To deploy the artifacts on AWS SSH pipeline steps plugin is used. 
* Once the build is pushed to the Nexus, we are pushing the Jar to remote EC2 machine and deploying the Jar using deploy.sh script. 
* Replace the remote host details in Jenkinsfile before running the pipeline. 

## Jenkinsfile
* All the pipeline stages are defined in Jenkinsfile.
* 


