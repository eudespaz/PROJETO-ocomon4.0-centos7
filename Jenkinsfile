pipeline {
    agent any

    stages {

        stage('Git push') {
            steps {
                git credentialsId: 'github', url: 'https://github.com/eudespaz/PROJETO-ocomon4.0-centos7.git', branch: 'master'
                    
            }
        }
    
        stage('Docker Build') {
            steps {
                script {dockerapp = docker.build("eudespaz/ocomon4.0:prod",
                    '-f /var/jenkins_home/workspace/PROJETO-OCOMON4.0/Dockerfile .')
                }
            }
        }
        
        stage('Docker Push Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                    dockerapp.push('latest')

                    }
                }
            }       
        }

        stage('Docker stack deploy') {
            steps {
                sh ''' 
                docker stack deploy -c docker-compose.yml servicedesk-ocomon4
                '''
            }
        
        }
      
    }
}