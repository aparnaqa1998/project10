pipeline {
    agent any
    
    environment {
        ARM_SUBSCRIPTION_ID = credentials('subscription-id')
        ARM_CLIENT_ID       = credentials('client-id')
        ARM_CLIENT_SECRET   = credentials('client-secret')
        ARM_TENANT_ID       = credentials('tenant-id')
    }

     stages {
         stage('Debug Environment Variables') {
            steps {
                script {
                    echo "ARM_SUBSCRIPTION_ID: ${env.ARM_SUBSCRIPTION_ID}"
                    echo "ARM_CLIENT_ID: ${env.ARM_CLIENT_ID}"
                    echo "ARM_CLIENT_SECRET: ${env.ARM_CLIENT_SECRET}" // Mask this in real-world usage
                    echo "ARM_TENANT_ID: ${env.ARM_TENANT_ID}"
                }
            }
        }

        stage('Version') {
            steps {
                sh 'az --version'          
            }
        }
        stage('Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Init - ugrade') {
            steps {
                sh 'terraform init -upgrade'
            }
        }
        stage('Clean up ') {
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
        stage('validate') {
            steps {
                sh 'terraform validate'
            }
        }
    }
}

