pipeline {
    agent {
        docker {
            image 'maven:3-alpine' 
            args '--name spring-boot-mysql-app -v /root/.m2:/root/.m2 --publish 80:80' 
        }
    }
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
		stage('Deliver') {
            steps {
                sh 'java -jar target/*.jar'
            }
        }
    }
}