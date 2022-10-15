pipeline {
    agent { 
        docker { image 'mcr.microsoft.com/dotnet/sdk:6.0' } 
    }
    environment {
       HOME = '/tmp'
    } 
    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('Build') {
            steps {
                dir('src') {
                  sh "dotnet build --configuration Release"
                }
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
