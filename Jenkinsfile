pipeline {
    agent any
    stages {
        stage('Cleanup') {
            steps {
                cleanWs()
            }
        }

        stage('Clone Git Repo') {
            steps {
                checkout scm
            }
        }
        stage('Clone from repository') {
            steps {
                git url: 'https://github.com/kanakraj/2244_ica2_.git', branch: 'develop', credentialsId: 'GIT'
            }
        }

        stage('Build and run docker image') {
            steps {
                sh 'sudo docker build -t kanakraj/2244_ica2:latest .'
                sh "sudo docker tag kanakraj/2244_ica2:latest kanakraj/2244_ica2:develop-${env.BUILD_ID}" 
                sh 'sudo docker run -d -p 8081:80 kanakraj/2244_ica2:latest'
            } 
        }


        stage('Build and Push') {
            steps {
                echo 'Building..'
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-auth', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        sh '''
                            sudo docker login -u ${USERNAME} -p ${PASSWORD}
                            sudo docker push kanakraj/2244_ica2:latest
                        '''
                        sh "sudo docker push kanakraj/2244_ica2:develop-${env.BUILD_ID}"
                    }
            }
        }

        stage('testing') {
            steps {
                sh 'curl -I 34.247.70.128:8081'
            }
        }

    
    }
}