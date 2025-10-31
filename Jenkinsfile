pipeline {
  agent any

  tools {
    terraform 'terraform_1.9.6_arm64'
  }

  environment {
    TF_WORKSPACE          = "default"
    AWS_ACCOUNT_ID        = "093326771949"
    AWS_REGION            = "ap-south-1"
    AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
  }

  stages {
    stage('Checkout') {
      steps {
        git url: 'https://github.com/cloudwavetechnologies/tf-vpc-subnet-creation-001.git', branch: 'Master'
      }
    }

    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Validate') {
      steps {
        sh 'terraform validate'
      }
    }

    stage('Terraform Plan') {
      steps {
        sh 'terraform plan -var-file="terraform.auto.tfvars" -out=tfplan.out'
      }
    }

    stage('Terraform Apply') {
      steps {
        script {
          def userApproval = input(
            id: 'ApplyApproval',
            message: 'Do you want to apply these Terraform changes?',
            parameters: [
              booleanParam(defaultValue: false, description: 'Confirm to apply infrastructure changes', name: 'CONFIRM_APPLY')
            ]
          )
          if (userApproval == true) {
            sh 'terraform apply tfplan.out'
          } else {
            error("Terraform apply aborted by user.")
          }
        }
      }
    }
  }

  post {
    success {
      echo '✅ Terraform deployment completed successfully.'
    }
    failure {
      echo '❌ Terraform deployment failed or was aborted.'
    }
  }
}