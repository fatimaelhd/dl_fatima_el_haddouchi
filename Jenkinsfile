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
                // Construire l'image en pointant vers le port du Docker Registry
                sh 'docker build -t host.docker.internal:8082/jee-projet:v1 .'
            }
        }

        stage('Push to Nexus') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'nexsus-docker',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    // Login et push vers le port 8082
                    sh 'docker login host.docker.internal:8082 -u $USER -p $PASS'
                    sh 'docker push host.docker.internal:8082/jee-projet:v1'
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
