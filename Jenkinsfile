pipeline {
    agent any

    parameters {
        choice(name: 'ENV', choices: ['dev', 'prod'], description: 'Choose environment to deploy')
    }

    environment {
        TF_VAR_FILE = "terraform/environments/${params.ENV}.tfvars"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-repo/terraform-vm.git'
            }
        }

        stage('Load Credentials') {
            steps {
                withCredentials([
                    string(credentialsId: 'AZURE_SUBSCRIPTION_ID', variable: 'ARM_SUBSCRIPTION_ID'),
                    string(credentialsId: 'AZURE_CLIENT_ID', variable: 'ARM_CLIENT_ID'),
                    string(credentialsId: 'AZURE_CLIENT_SECRET', variable: 'ARM_CLIENT_SECRET'),
                    string(credentialsId: 'AZURE_TENANT_ID', variable: 'ARM_TENANT_ID'),
                    string(credentialsId: 'SSH_PUBLIC_KEY', variable: 'TF_VAR_admin_ssh_key')
                ]) {
                    sh 'echo "Loaded Azure and SSH credentials"'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -var-file=$TF_VAR_FILE'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve -var-file=$TF_VAR_FILE'
            }
        }
    }

    post {
        always {
            sh 'terraform destroy -auto-approve -var-file=$TF_VAR_FILE'
        }
    }
}

