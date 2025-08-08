pipeline {
    agent any // Run on any available Jenkins agent

    stages {
        stage('1. Checkout from Git') {
            steps {
                // Clones the repository specified in the Jenkins job configuration
                echo "Cloning the repository..."
                checkout scm
            }
        }

        stage('2. Build Docker Image') {
            steps {
                script {
                    echo "Building the Docker image locally..."
                    // The '-t' flag tags the image with a name (my-local-webapp)
                    // The '.' refers to the current directory as the build context
                    sh 'docker build -t my-local-webapp:latest .'
                }
            }
        }

        stage('3. Stop & Remove Old Container') {
            steps {
                script {
                    echo "Checking for and removing any existing container..."
                    // This makes the pipeline re-runnable.
                    // '|| true' ensures the command doesn't fail if the container doesn't exist.
                    sh 'docker stop my-webapp-container || true'
                    sh 'docker rm my-webapp-container || true'
                }
            }
        }

        stage('4. Run New Docker Container') {
            steps {
                script {
                    echo "Running the new Docker container..."
                    // -d: runs the container in detached mode (in the background)
                    // --name: assigns a specific name to the container
                    // -p 8080:80: maps port 8080 on the Rocky Linux host to port 80 in the container
                    // my-local-webapp:latest: specifies the image to run
                    sh 'docker run -d --name my-webapp-container -p 8080:80 my-local-webapp:latest'
                }
            }
        }
    }

    post {
        // This block runs after all stages are completed
        always {
            echo 'Pipeline has finished.'
            sh 'docker ps' // Shows currently running containers as verification
        }
    }
}