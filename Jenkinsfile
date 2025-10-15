pipeline {
  agent any
  tools {
    terraform 'terraform_1.9.6'
  }
  environment {
    TF_WORKSPACE = "default"
    AWS_REGION   = "eu-north-1"
  }

  stages {
    stage('Checkout') {
      steps {
        git url: 'https://github.com/cloudwavetechnologies/tf-vpc-subnet-creation-001.git', branch: 'Master'
      }
    }

    stage('Terraform Init') {
      steps {
        sh 'terraform init -backend-config=backend.tf'
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
        input message: "Approve infrastructure changes?"
        sh 'terraform apply tfplan.out'
      }
    }
  }

  post {
    success {
      echo 'Terraform deployment completed successfully.'
    }
    failure {
      echo 'Terraform deployment failed.'
    }
  }
}
