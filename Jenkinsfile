pipeline {
    agent any
    
    environment {
        ARM_SUBSCRIPTION_ID = credentials('subscription-id')
        ARM_CLIENT_ID       = credentials('client-id')
        ARM_CLIENT_SECRET   = credentials('client-secret')
        ARM_TENANT_ID       = credentials('tenant-id')
    }

     stages {

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

