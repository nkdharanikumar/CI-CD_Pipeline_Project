pipeline {
    agent any

    tools {
        // if you are using Maven/Node we will add here later
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/nkdharanikumar/CI-CD_Pipeline.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                echo 'Build step will go here'
            }
        }

        stage('Sonar Analysis') {
            steps {
                echo 'SonarQube step will go here'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Docker build step will go here'
            }
        }
    }
}
