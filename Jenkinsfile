pipeline {
    agent any

    stages {
        stage('1. Checkout from Git') {
            steps {
                echo "Cloning the repository..."
                checkout scm
            }
        }

        stage('2. Build Docker Image') {
            steps {
                script {
                    echo "Building the Docker image locally..."
                    sh 'docker build -t devops-assign-2:latest .'
                }
            }
        }

        stage('3. Stop & Remove Old Container') {
            steps {
                script {
                    echo "Checking for and removing any existing container..."
                    sh 'docker stop DevOps-Assign-2 || true'
                    sh 'docker rm DevOps-Assign-2 || true'
                }
            }
        }

        stage('4. Run New Docker Container') {
            steps {
                script {
                    echo "Running the new Docker container..."
                    sh 'docker run -d --name DevOps-Assign-2 -p 8081:80 devops-assign-2:latest'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline has finished.'
            sh 'docker ps'
        }
    }
}