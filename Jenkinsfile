pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                dotnetBuild configuration: 'Release',
                    sdk: '.Net-SDK-6.0',
                    workDirectory: 'src'
            }
        }
        stage('Test-Build') {
            steps {
                dotnetTest configuration: 'Release', sdk: '.Net-SDK-6.0', workDirectory: 'src'
            }
        }
        stage('Publish') {
            steps {
                dotnetPublish configuration: 'Release', outputDirectory: '/home/chess/jenkins/WebChess', sdk: '.Net-SDK-6.0', selfContained: true, verbosity: 'n', workDirectory: 'src'
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
