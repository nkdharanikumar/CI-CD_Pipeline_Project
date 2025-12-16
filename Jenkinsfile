pipeline {
    agent any

    environment {
        // Must match SonarQube server Name in Jenkins global config
        SONARQUBE_SERVER = 'JenkinsSonarqube'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/nkdharanikumar/CI-CD_Pipeline_Project.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                echo 'Build step will go here'
                // Example for Node:
                // bat 'npm install && npm test'
                // Example for Maven:
                // bat 'mvn clean verify'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv("${SONARQUBE_SERVER}") {
                    // Assumes sonar-scanner is installed on the Jenkins Windows machine and in PATH
                    bat '''
                      sonar-scanner ^
                        -Dsonar.projectKey=ci-cd-pipeline-project ^
                        -Dsonar.sources=. ^
                        -Dsonar.host.url=http://localhost:9000
                    '''
                }
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Docker build step will go here'
                // Example after you add a Dockerfile:
                // bat 'docker build -t ci-cd-pipeline-image .'
                // bat 'docker run -d --name ci-cd-app -p 8082:80 ci-cd-pipeline-image'
            }
        }
    }
}
