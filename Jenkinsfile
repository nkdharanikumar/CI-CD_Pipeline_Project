pipeline {
    agent any

    environment {
        SONARQUBE_SERVER = 'JenkinsSonarqube'
    }

    tools {
        // this name must match the one in "Global Tool Configuration"
        sonarQubeScanner 'sonar-scanner'
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
                        def scannerHome = tool 'sonar-scanner'
                        bat "\"${scannerHome}\\bin\\sonar-scanner.bat\" -Dsonar.projectKey=ci-cd-pipeline-project -Dsonar.sources=. -Dsonar.host.url=http://localhost:9000"
                    }
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
