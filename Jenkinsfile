pipeline {
    agent any
    stages {
        stage('Deploy container into App server') {
            steps {
                sshagent(['kanakraj321']) {
                    sh '''
                        ssh -tt vagrant@54.78.149.249 -o StrictHostKeyChecking=no "sudo docker pull kanakraj321/2244_ica2:latest"
                        ssh -tt vagrant@54.78.149.249 -o StrictHostKeyChecking=no "sudo docker stop exam-nginx || true && sudo docker rm exam-nginx || true"
                        ssh -tt vagrant@54.78.149.249 -o StrictHostKeyChecking=no "sudo docker run --name exam-nginx -d -p 8083:80 kanakraj321/2244_ica2:latest"
                    '''
                }
            }
        }

        stage('Testing') {
            steps {
                sh '''
                    if ! curl -I 54.78.149.249:8083; then
                        echo "Container is not accessible"
                        exit 1
                    fi
                '''
            }
        }
    }
}
