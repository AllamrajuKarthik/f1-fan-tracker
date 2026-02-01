pipeline {
    agent any

    stages {

        stage('Stop old containers') {
            steps {
                sh 'docker-compose down || true'
            }
        }

        stage('Build & Deploy containers') {
            steps {
                sh 'docker-compose up -d --build'
            }
        }
    }

    post {
        success {
            echo 'Deployment completed successfully!! ITT WORKSSS!!'
        }
        failure {
            echo 'Deployment failed!!!! Check logs'
        }
    }
}
