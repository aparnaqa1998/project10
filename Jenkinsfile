pipeline {
    agent any
    
    environment {
        ARM_SUBSCRIPTION_ID = credentials('subscription-id')
        ARM_CLIENT_ID       = credentials('client-id')
        ARM_CLIENT_SECRET   = credentials('client-secret')
        ARM_TENANT_ID       = credentials('tenant-id')
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Clone the repository containing Terraform code
                git branch: 'master', url: 'https://github.com/aparnaqa1998/project10.git'
            }
        }

        stage('Initialize Terraform') {
            steps {
                // Initialize Terraform
                sh 'terraform init'
            }
        }

        stage('Validate Terraform Configuration') {
            steps {
                // Validate the Terraform files
                sh 'terraform validate'
            }
        }

        stage('Plan Terraform Changes') {
            steps {
                // Generate the Terraform plan
                sh 'terraform plan -var="subscription_id=$ARM_SUBSCRIPTION_ID" -var="client_id=$ARM_CLIENT_ID" -var="client_secret=$ARM_CLIENT_SECRET" -var="tenant_id=$ARM_TENANT_ID" -out=plan.tfplan'
            }
        }

        stage('Apply Terraform Changes') {
            steps {
                // Apply the Terraform changes
                sh 'terraform apply -auto-approve plan.tfplan'
            }
        }

        stage('Validate Deployment') {
            steps {
                // Run deployment validation scripts or commands
                sh 'terraform output'
                // Add custom validation scripts or commands here
            }
        }
    }

    post {
        always {
            // Clean up any temporary files or resources
            cleanWs()
        }
        success {
            // Actions on success, e.g., notification
            echo 'Deployment successful!'
        }
        failure {
            // Actions on failure, e.g., notification
            echo 'Deployment failed!'
        }
    }
}
