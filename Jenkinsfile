pipeline {
    agent any

    stages {
        stage('Pull from GitHub') {
            steps {
                // Pull the latest code from the GitHub repository
                git branch: 'main', url: 'https://github.com/Rithigasri/carwebsite.git'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    // Perform SonarQube code analysis for static HTML
                    withSonarQubeEnv('SonarQube Server2') {
                        bat """
                        cd C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\sonarqube-car
                        C:\\Users\\Rithigasri\\Downloads\\sonar-scanner-cli-6.1.0.4477-windows-x64\\sonar-scanner-6.1.0.4477-windows-x64\\bin\\sonar-scanner -Dsonar.projectKey=carwebsite -Dsonar.sources=. -Dsonar.host.url=http://localhost:9000 -Dsonar.login=sqa_d5370abf2e085a0b3c8f0919367f209ca842793f
                        """
                    }
                }
            }
        }

        stage('Deploy to IIS') {
            steps {
                script {
                    // Define the target path for IIS deployment
                    def sitePath = 'C:\\inetpub\\wwwroot\\website'
                    
                    // Ensure the target directory exists
                    bat "if not exist ${sitePath} mkdir ${sitePath}"
                    
                    // Delete existing files in the IIS directory
                    bat "del /q ${sitePath}\\*.*"
                    bat "for /d %%p in (${sitePath}\\*) do rmdir /s /q %%p"
                    
                    // Copy new files to IIS directory
                    bat "xcopy /s /e /y . ${sitePath}\\"
                    
                    // Optional: Restart IIS if necessary
                    bat 'iisreset'
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
