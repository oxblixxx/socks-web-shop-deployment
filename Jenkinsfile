#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage("Create an EKS Cluster") {
            steps {
                script {
                    dir('jenkins-pipeline/infrastructure') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }


                stage("deploy monitoring") {
            steps {
                script {
                    dir('jenkins-pipeline/monitoring') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }

        stage("Deploy nginx app") {
            steps {
                script {
                    dir('jenkins-pipeline/web') {
                        sh "kubectl apply -f web.yaml"
                    }
                }
            }
        }

        stage("Deploy sock-shop to EKS") {
            steps {
                script {
                    dir('sock-shop') {
                        sh "kubectl apply -f complete-deployment.yaml"
                    }
                }
            }
        }

        stage("Deploy ingress rule") {
            steps {
                script {
                    dir('ingress-rule') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }
    }
}
       
