pipeline {
    agent any
     stages {
        stage('Init') {
            steps {
                bat 'terraform init'
            }
        }
        stage('Init - ugrade') {
            steps {
                bat 'terraform init -upgrade'
            }
        }
        stage('Clean up ') {
            steps {
                 withCredentials([azureServicePrincipal(
                     credentialsId: 'SA_TF',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
          )])  {
          bat '''
                         echo "Applying the plan with auto approve and SP variables"
                        terraform apply -auto-approve -var "client_id=$ARM_CLIENT_ID" -var "client_secret=$ARM_CLIENT_SECRET" -var "subscription_id=$ARM_SUBSCRIPTION_ID" -var "tenant_id=$ARM_TENANT_ID"
                        terraform output -json > terraform_outputs.json
                        '''
           }
        }
        }
        stage('validate') {
            steps {
                bat 'terraform validate'
            }
        }
         stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool 'SonarQube Scanner'
                    withSonarQubeEnv('sonar-config') {
                        sh "${scannerHome}/bin/sonar-scanner"
                    }
                }
            }
    }
  }
}

