pipeline {
    agent any
     stages {
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
                 withCredentials([azureServicePrincipal(
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
          )])  {
          sh '''
                         echo "Applying the plan with auto approve and SP variables"
                        terraform apply -auto-approve -var "client_id=$ARM_CLIENT_ID" -var "client_secret=$ARM_CLIENT_SECRET" -var "subscription_id=$ARM_SUBSCRIPTION_ID" -var "tenant_id=$ARM_TENANT_ID"
                        ls -lah
                        '''
           }
        }
        }
        stage('validate') {
            steps {
                sh 'terraform validate'
            }
        }
    }
}

