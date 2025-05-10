pipeline {
  agent any

  environment {
    AWS_DEFAULT_REGION = 'ap-south-1'
  }

  stages {
    stage('Checkout Terraform Code') {
      steps {
        // Pull from Git using credential ID 'aws-business-onboarding'
        git(
          url: 'https://github.com/JaiSinghShah/aws-business-onboarding-create-ec2',
          branch: 'main',
          credentialsId: 'aws-business-onboarding'
        )
      }
    }

    stage('Terraform Init & Validate') {
      steps {
        // Inject AWS creds into env for Terraform
        withCredentials([usernamePassword(
          credentialsId: 'AWS-Cred',
          usernameVariable: 'AWS_ACCESS_KEY_ID',
          passwordVariable: 'AWS_SECRET_ACCESS_KEY'
        )]) {
          bat 'terraform init'
          bat 'terraform validate'
        }
      }
    }

    stage('Terraform Plan') {
      steps {
        withCredentials([usernamePassword(
          credentialsId: 'AWS-Cred',
          usernameVariable: 'AWS_ACCESS_KEY_ID',
          passwordVariable: 'AWS_SECRET_ACCESS_KEY'
        )]) {
          bat 'terraform plan -var-file=terraform.tfvars -out=tfplan.out'
        }
      }
    }

    stage('Terraform Apply') {
      steps {
        withCredentials([usernamePassword(
          credentialsId: 'AWS-Cred',
          usernameVariable: 'AWS_ACCESS_KEY_ID',
          passwordVariable: 'AWS_SECRET_ACCESS_KEY'
        )]) {
          input message: "Apply Terraform plan?", ok: "Yes, apply"
          bat 'terraform apply -auto-approve tfplan.out'
        }
      }
    }
  }

  post {
    success {
      echo "Infrastructure deployed successfully!"
    }
    failure {
      echo "Deployment failed - check logs for errors."
    }
    always {
      archiveArtifacts artifacts: '**/*.tf', fingerprint: true
    }
  }
}
