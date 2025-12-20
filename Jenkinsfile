pipeline {
    agent any

    tools {
        maven 'maven-3'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps {
                sh 'mvn clean test'
            }
        }

        stage('Build JAR') {
            steps {
                sh 'mvn package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t host.docker.internal:8081/jee-projet:v1 .'
            }
        }

        stage('Push to Nexus') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'nexsus-docker', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh 'docker --config /var/jenkins_home/.docker login host.docker.internal:8081 -u $USER -p $PASS '
                    sh 'docker --config /var/jenkins_home/.docker push host.docker.internal:8081/jee-projet:v1 '
                }
            }
        }


        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonar') {
                    sh 'mvn sonar:sonar -Dsonar.projectKey=jee-projet'
                }
            }
        }
    }

    post {
        always {
            junit 'target/surefire-reports/*.xml'
        }
    }
}
