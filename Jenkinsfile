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
            when {
                expression { choice == '1'}
                }
                steps {
                    script {
                       dir('jenkins-pipeline-deploy-to-eks/infrastructure') {
                          sh "terraform init"
                      //    sh "terraform destroy -target=module.eks.module.kms.aws_kms_alias.this[0]"
                          sh "terraform init -upgrade"
                          sh "terraform apply -auto-approve"
                         }
                     }
               }
          }

                


         stage("deploy socks && web ]") {
              when {
                expression { choice == '2'}
                }
                steps {

                  script {
                     dir('jenkins-pipeline-deploy-to-eks/deployment') {
                        sh "terraform init"
                        sh "terraform init -upgrade"
                        sh "terraform apply --auto-approve"
                    }
                }
            }
        }

         stage("deploy monitoring]") {
             when {
                expression { choice == '3'}
                }
                steps {
                  script {
                    dir('jenkins-pipeline-deploy-to-eks/monitoring') {
                        sh "terraform init"
                        sh "terraform init -upgrade"
                        sh "terraform apply --auto-approve"
                    }
                }
            }
        }


        // stage('Create Namespace') {
        //     steps {
        //         script {
        //         def namespace = 'sock-shop'
        //         def namespaceExists = sh(script: "kubectl get namespace $namespace", returnStatus: true) == 0

        //         if (namespaceExists) {
        //             echo "Namespace already exists, skipping creation!!!!!"
        //         } else {
        //             sh "kubectl create namespace $namespace"
        //             echo "Namespace created successfully now!"
        //         }
        //         }
        //     }
        // }       

        stage("Deploy to EKS") {
            when {
                expression { choice == '4'}
                  }
            
              steps {
                
                  script {
                     dir('jenkins-pipeline-deploy-to-eks/kubernetes') {
                        sh "aws eks update-kubeconfig --name myapp-eks-cluster"
                        sh "kubectl apply -f eks-manifest.yaml --namespace sock-shop"
                        sh "kubectl apply -f ../../web/ --namespace web-namespace"
                        // sh "kubectl apply -f nginx-service.yaml"
                    }
                }
            }
        }
    }
}
