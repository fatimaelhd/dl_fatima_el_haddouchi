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