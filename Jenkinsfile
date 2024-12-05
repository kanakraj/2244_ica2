pipeline {
    agent any
    stages {
        stage('Build and run docker image') {
            steps {
                sh 'sudo docker pull kanakraj321/2244_ica2:latest'
                sh 'sudo docker run -d -p 8082:80 kanakraj321/2244_ica2:latest'
            }
        }


        stage('testing') {
            steps {
                sh 'curl -I 54.247.149.215:8082'
            }
        }

    
    }
}
