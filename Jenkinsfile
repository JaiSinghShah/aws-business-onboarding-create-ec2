pipeline {
    agent any
    environment {
        TF_VAR_region = "us-east-1"
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

        stage('Terraform Destroy') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS-Cred']]) {
                    bat 'terraform destroy -auto-approve'
                }
            }
        }
    }
}
