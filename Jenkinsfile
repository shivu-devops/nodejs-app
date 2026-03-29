pipeline {
    agent any
    tools{
        nodejs 'nodejs'
    }
    environment{
        SCANNER_HOME= tool 'sonar-scanner'
    }

    stages {

        // stage('git-checkout') {
        //     steps {
        //         git 'https://github.com/shivu-devops/nodejs-app.git'
        //     }
        // }

        stage('Lint') {
            steps {
                sh '''
                cd backend
                npm install
                npm run lint
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                cd backend
                npm test
                '''
            }
        }


        stage('Sonar Analysis') {
            steps {
               withSonarQubeEnv('sonar'){
                   sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=task-app \
                   -Dsonar.projectKey=task-app '''
               }
            }
        }

        stage('Docker Build') {
            steps {
               script{
                   withDockerRegistry(credentialsId: 'docker-cred') {
                    sh "docker build -t  task-app ."
                 }
               }
            }
        }

        stage('Docker Push') {
            steps {
               script{
                   withDockerRegistry(credentialsId: 'docker-cred') {
                    sh "docker tag task-app shivu27/task-app:latest"
                    sh "docker push shivu27/task-app:latest"
                 }
               }
            }
        }

		stage('Deploy Application') {
            steps {
               script{
                   withDockerRegistry(credentialsId: 'docker-cred') {
                    sh '''
                    docker stop task-app || true
                    docker rm task-app || true
                    docker run -d --name=task-app -p 3001:3000 shivu27/task-app:latest
                    '''
                 }
               }
            }
        }
	}
        
    post {
        success {
            echo 'Application deployed successfully'
        }
        failure {
            echo 'Pipeline failed'
        }
    }

}
