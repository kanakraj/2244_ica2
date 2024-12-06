pipeline {
    agent any
    stages {
        // stage('Build and run docker image') {
        //     steps {
        //         sh 'sudo docker stop exam-nginx || true && docker rm exam-nginx || true'
        //         sh 'sudo docker pull kanakraj321/2244_ica2:latest'
        //         sh 'sudo docker run --name exam-nginx -d -p 8083:80 kanakraj321/2244_ica2:latest'
        //     }
        // }

        stage('Deploy container into App server') {
            steps {
                sshagent(['kanakraj321']) {
                    // withCredentials([usernamePassword(credentialsId: 'DockerHubPwd', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        sh '''
                            ssh -tt vagrant@54.78.149.249 -o StrictHostKeyChecking=no "sudo docker pull kanakraj321/2244_ica2:latest"
                            ssh -tt vagrant@54.78.149.249 -o StrictHostKeyChecking=no "sudo docker stop exam-nginx || true && docker rm exam-nginx || true"
                            ssh -tt vagrant@54.78.149.249 -o StrictHostKeyChecking=no "sudo docker run --name exam-nginx -d -p 8083:80 kanakraj321/2244_ica2:latest"
                        '''
                    // }
                }
            }
        }


        stage('testing') {
            steps {
                sh 'curl -I 54.78.149.249:8083'
            }
        }


    }
}
