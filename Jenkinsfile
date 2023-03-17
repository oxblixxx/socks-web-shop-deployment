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
                    dir('jenkins-pipeline-deploy-to-eks/terraform') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }

        stage('Create Namespace') {
            steps {
                script {
                def namespace = 'sock-shop'
                def namespaceExists = sh(script: "kubectl get namespace $namespace", returnStatus: true) == 0

                if (namespaceExists) {
                    echo "Namespace already exists, skipping creation!!"
                } else {
                    sh "kubectl create namespace $namespace"
                    echo "Namespace created successfully now!"
                }
                }
            }
        }       

        stage("Deploy to EKS") {
            steps {
                script {
                    dir('jenkins-pipeline-deploy-to-eks/kubernetes') {
                        sh "aws eks update-kubeconfig --name myapp-eks-cluster"
                        sh "kubectl apply -f eks-manifest.yaml --namespace sock-shop"
                        // sh "kubectl apply -f nginx-service.yaml"
                    }
                }
            }
        }
    }
}