pipeline {
    agent any

    environment {
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
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv("${SONARQUBE_SERVER}") {
                    sh '''
                      sonar-scanner \
                        -Dsonar.projectKey=ci-cd-pipeline \
                        -Dsonar.sources=. \
                        -Dsonar.host.url=http://localhost:9000
                    '''
                }
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Docker build step will go here'
            }
        }
    }
}
