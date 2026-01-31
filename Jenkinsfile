pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/AllamrajuKarthik/f1-fan-tracker.git'
            }
        }

        stage('Stop old containers') {
            steps {
                sh 'docker compose down || true'
            }
        }

        stage('Build containers') {
            steps {
                sh 'docker compose build'
            }
        }

        stage('Deploy new containers') {
            steps {
                sh 'docker compose up -d'
            }
        }
    }

    post {
        success {
            echo 'CI/CD pipeline executed successfully! IT WORKSS!!'
        }
        failure {
            echo 'Pipeline failed!!BRUH JUST CHECK IT AGAIN!!'
        }
    }
}
