pipeline {
    agent any

    stages {

        stage('Cleanup old containers') {
            steps {
                sh '''
                  docker-compose down || true
                  docker rm -f f1_mysql f1_flask f1_nginx || true
                '''
            }
        }

        stage('Build & Deploy') {
            steps {
                sh 'docker-compose up -d --build'
            }
        }
    }

    post {
        success {
            echo 'Deployment completed successfully!!! IT WORKS!!!'
        }
        failure {
            echo 'Deployment failed!!!!Check logs'
        }
    }
}
