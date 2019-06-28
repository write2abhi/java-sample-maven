pipeline {
    agent any
    tools {
        maven 'Maven 3.3.9'
        jdk 'jdk8'
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }   
        stage('Unit Test') {
            steps {
                sh 'mvn test'
            }
          }
        stage(Integration Test) {
            steps {
                sh 'mvn clean verify'
            }
          }
        }
    }
