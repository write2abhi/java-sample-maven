# A Java/Maven/JUnit HelloWorld example

A „Hello World!” sample written in Java using Maven for the build, that showcases a few very simple tests.

This example demonstrates:

* A simple Java 8 application with tests
* Unit tests written with [JUnit 5](https://junit.org/junit5/)
* Integration tests written with [JUnit 5](https://junit.org/junit5/)
* Code coverage reports via [JaCoCo](https://www.jacoco.org/jacoco/)
* A Maven build that puts it all together

## Running the tests

* To run the unit tests, call `mvn test`
* To run the integration tests as well, call `mvn verify`
* Code coverage reports are generated when `mvn verify` (or a full `mvn clean install`) is called.
  Point a browser at the output in `target/site/jacoco-both/index.html` to see the report.

## Conventions

This example follows the following basic conventions:

| | unit test | integration test |
| --- | --- | --- |
| **resides in:** | `src/test/java/*Test.java` | `src/test/java/*IT.java` |
| **executes in Maven phase:** | test | verify |
| **handled by Maven plugin:** | [surefire](http://maven.apache.org/surefire/maven-surefire-plugin/) | [failsafe](http://maven.apache.org/surefire/maven-failsafe-plugin/) |

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
