pipeline {
    agent any
    
    environment {
        // Environment variables for credentials or other settings
        TF_VAR_region = 'us-west-2'
        TF_VAR_environment = 'production'
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
                sh 'terraform plan -out=plan.tfplan'
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
