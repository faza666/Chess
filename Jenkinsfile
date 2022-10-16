pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                dir('src') {
                  sh "dotnet build --configuration Release"
                }
            }
        }
        stage('Test-Build') {
            steps {
                dir('src') {
                  sh "dotnet test --configuration Release"
                }
            }
        }
        stage('Create initial migration') {
            steps {
                dir('src/Data/Chess.Data') {
                  sh "/home/chess/.dotnet/tools/dotnet-ef migrations add InitialCreate"
                }
            }
        }
        stage('Update Database') {
            steps {
                dir('src/Data/Chess.Data') {
                  sh "/home/chess/.dotnet/tools/dotnet-ef database update"
                }
            }
        }
        stage('Publish') {
            steps {
                dir('src') {
                  sh "dotnet publish -c Release -o WebChess"
                }
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
