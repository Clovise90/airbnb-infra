
def COLOR_MAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger',
    ]

pipeline {
    agent any
    
    tools {
        terraform 'Terraform'
    }
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
    }   

    stages {
        stage('git checkout') {
            steps {
                echo 'cloning codebase'
                git branch: 'main', credentialsId: '36c61934-9dd3-42e5-8165-5bd48ca1fa81', url: 'https://github.com/Clovise90/airbnb-infra.git'
                sh 'ls'
            }
        }
        
        stage('terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        
        stage('terraform validate') {
            steps {
                sh 'terraform validate'
            }
        }
        
        stage('terraform plan') {
            steps {
                sh 'terraform plan'
            }
        }
        
        stage('terraform apply') {
            steps {
                sh 'terraform apply --auto-approve'
                // sh 'terraform apply --auto-approve'
                // sh 'terraform destory --auto-approve'
            }
        }
        
        stage('terraform destroy') {
            steps {
                sh 'terraform destroy --auto-approve'
                // sh 'terraform apply --auto-approve'
                // sh 'terraform destory --auto-approve'
            }
        }
        
    }
    
    post { 
        always { 
            echo 'I will always say Hello again!'
            slackSend channel: '#jjtech-empower-batch', color: COLOR_MAP[currentBuild.currentResult], message: "Done by Clovise. *${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}"
        }
    }
    
}
