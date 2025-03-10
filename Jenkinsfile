pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials'
        DOCKER_IMAGE = 'hhameem/welcomeapp:v1'
    }

    tools {
        maven 'Maven'
    }

    stages {
        stage('Checkout') {
            steps {
              
                git branch: 'main', url: 'https://github.com/HHameem/COMP367-WelcomeApp.git'
            }
        }

        stage('Build Maven Project') {
            steps {
                // Build the Maven project
                bat 'mvn clean package'
            }
        }

        stage('Docker Login') {
            steps {
                script {
                    
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        sh 'echo Docker login successful'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                   
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            }
        }
    }

    post {
        success {
            echo "Build completed successfully!"
        }
        failure {
            echo "Build failed. Please check the logs for more details."
        }
    }
}

