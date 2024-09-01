pipeline {
    agent any
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

