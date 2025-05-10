pipeline {
    agent any
    environment {
        TF_VAR_region = "ap-south-1"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/JaiSinghShah/aws-business-onboarding-create-ec2.git'
            }
        }

        stage('Terraform Init/Plan/Apply') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS-Cred']]) {
                    bat 'terraform init'
                    bat 'terraform plan'
                    bat 'terraform apply -auto-approve'
                }
            }
        }
    }
}
