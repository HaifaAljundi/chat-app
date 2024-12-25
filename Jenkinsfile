pipeline {
    agent any
    stages {
        // Stage 1: Build
        stage('Build') {
            steps {
                echo 'Building the application...'
                // Build the Docker image
                sh 'docker build -t simple-chat-app .'
            }
        }

        // Stage 2: Test
        stage('Test') {
            steps {
                echo 'Testing the application...'
                // Running Python tests to check the homepage and content
                sh 'python3 test_homepage.py'  // Runs homepage response test
                sh 'python3 test_content.py'   // Runs content validation test
            }
        }

        // Stage 3: Deploy
        stage('Deploy') {
            steps {
                echo 'Deploying the application (locally)...'
                // Run the Docker container locally
                sh 'docker run -d -p 8080:80 simple-chat-app'
                // Optional: Wait a few seconds to ensure the container has started
                sleep(5)
                // You can add health check or verify the application is running by using curl
                echo 'Verifying the application is running...'
                sh 'curl -f http://localhost:8080 || exit 1'  // Check if app is accessible
            }
        }
    }

    post {
        // Post-build actions (optional)
        success {
            echo 'Deployment was successful!'
        }
        failure {
            echo 'Deployment failed! Rolling back...'
            // Optional: Rollback if something fails
            sh 'docker stop simple-chat-app || true'
            sh 'docker rm simple-chat-app || true'
        }
    }
}
