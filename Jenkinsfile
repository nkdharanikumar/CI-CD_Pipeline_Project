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
                    script {
                        // "sonar-scanner" must match the Name in Global Tool Configuration
                        def scannerHome = tool 'sonar-scanner'
                        bat "\"${scannerHome}\\bin\\sonar-scanner.bat\" -Dsonar.projectKey=ci-cd-pipeline-project -Dsonar.sources=. -Dsonar.host.url=http://localhost:9000"
                    }
                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    bat 'docker build -t ci-cd-pipeline-image .'
                    bat 'docker rm -f ci-cd-app || echo "no existing container"'
                    bat 'docker run -d --name ci-cd-app -p 8082:80 ci-cd-pipeline-image'
                }
            }
        }
    }
}
