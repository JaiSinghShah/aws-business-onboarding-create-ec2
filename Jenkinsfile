pipeline {
    agent any
    environment {
        // This is optional; you can also define inside withCredentials block
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
                    sh 'terraform init'
                    sh 'terraform plan'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
