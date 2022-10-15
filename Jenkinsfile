pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                docker pull mcr.microsoft.com/dotnet/sdk:6.0
            }
        }
        stage('Build') {
            steps {
                echo 'Build'
            }
        }
        stage('Test-Build') {
            steps {
                echo 'Test-Build'
            }
        }
        stage('Publish') {
            steps {
                echo 'Publish'
            }
        }
        stage('Test-Publish') {
            steps {
                echo 'Test-Publish'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploy'
            }
        }
        stage('Run') {
            steps {
                echo 'Run'
            }
        }
        stage('Test-Run') {
            steps {
                echo 'Test-Run'
            }
        }
    }
}
