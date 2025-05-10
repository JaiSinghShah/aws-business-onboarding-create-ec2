pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Pull Terraform files from your GitHub repository
                git 'https://github.com/JaiSinghShah/aws-business-onboarding-create-ec2.git'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Initialize Terraform
                    withCredentials([aws(credentialsId: 'aws-access-key-id', region: 'ap-south-1')]) {
                        bat 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Generate and show the Terraform execution plan
                    withCredentials([aws(credentialsId: 'aws-access-key-id', region: 'ap-south-1')]) {
                        bat 'terraform plan -out=tfplan'
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Apply the Terraform configuration and create the EC2 instance
                    withCredentials([aws(credentialsId: 'aws-access-key-id', region: 'ap-south-1')]) {
                        bat 'terraform apply -auto-approve tfplan'
                    }
                }
            }
        }

        stage('Terraform Output') {
            steps {
                script {
                    // Display Terraform outputs
                    withCredentials([aws(credentialsId: 'aws-access-key-id', region: 'ap-south-1')]) {
                        bat 'terraform output'
                    }
                }
            }
        }
    }

    post {
        success {
            echo "EC2 instance created successfully!"
        }
        failure {
            echo "Something went wrong!"
        }
    }
}
