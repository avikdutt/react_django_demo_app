pipeline {
    agent {label "dev-server"}
    
    stages {
        
        stage ("code"){
            steps {
                git url: "https://github.com/LondheShubham153/react_django_demo_app", branch: "main"
                echo 'code is cloned'
            }
        }
        stage ("build & test"){
            steps{
                sh "docker build -t react_django_demo_app ."
                echo 'build is done'
            }
        }
        stage ("scan image"){
            steps {
                echo 'snanning done'
            }
        }
        stage ("push"){
            steps {
                withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker tag react_django_demo_app:latest ${env.dockerHubUser}/react_django_demo_app:latest"
                sh "docker push ${env.dockerHubUser}/react_django_demo_app:latest"
                echo 'image is pushed to dockerhub'
                }
            }
            
        }
        stage ("deploy"){
            steps {
                sh "docker-compose down && docker-compose up -d"
                echo 'code is deployed'
            }
        }
    }
}
