pipeline {
    agent any
     stages {
        stage('Install Ansible') {
            steps {
                script {
                    // Install Ansible on the Jenkins agent
                    sh '''
                    sudo apt update
                    sudo apt install -y software-properties-common
                    sudo add-apt-repository --yes --update ppa:ansible/ansible
                    sudo apt install -y ansible
                    '''
                }
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
                 withCredentials([azureServicePrincipal(
                     credentialsId: 'SA_TF',
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
        stage('Configure Azure Storage with Ansible') {
            steps {
                script {
                    // Extract Terraform outputs
                    def outputs = readJSON file: 'terraform_outputs.json'
                    def resourceGroupName = outputs.resource_group_name.value
                    def storageAccountName = outputs.storage_account_name.value
                    def location = outputs.location.value
                    def subscriptionId = outputs.subscription_id.value

                    // Run the Ansible playbook using the Terraform outputs
                    sh """
                    ansible-playbook create_storage_account_advanced.yml \
                      -e "resource_group_name=${resourceGroupName}" \
                      -e "storage_account_name=${storageAccountName}" \
                      -e "location=${location}" \
                      -e "subscription_id=${subscriptionId}"
                    """
                }
            }
        }
    }
}

