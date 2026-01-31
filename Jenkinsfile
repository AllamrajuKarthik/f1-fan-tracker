pipeline {
    agent any

    stages {

        stage('Stop old containers') {
            steps {
                sh 'docker-compose down || true'
            }
        }

        stage('Build containers') {
            steps {
                sh 'docker-compose build'
            }
        }

        stage('Deploy new containers') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }

    post {
        success {
            echo 'Deployment completed successfully! It Worksssss!!'
        }
        failure {
            echo 'Deployment failed!! Check the logs and try again!!'
        }
    }
}
