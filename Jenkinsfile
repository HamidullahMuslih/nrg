pipeline {

    agent any

    environment {
        registry = "hamidullahmusih/app"
        registryCredential = 'dockerhub'
    }

    stages{


        stage('Fetch Code') {
            steps {
                git branch: 'main', url: 'https://github.com/HamidullahMuslih/nrg.git'
            }

        stage('BUILD'){
            steps {
                sh 'npm install'
            }
        }

        stage('UNIT TEST'){
            steps {
                sh 'cd app && npm test'
            }
        }


        stage('Scanning with Snyk') {
        snykSecurity organisation: '', projectName: '', severity: 'medium', snykInstallation: 'Snyk', snykTokenId: "$SNYK_TOKEN" , targetFile: 'app/package.json'
        }


        stage('Building image') {
            steps{
              script {
                dockerImage = docker.build registry + ":$BUILD_NUMBER"
              }
            }
        }
        
        stage('Deploy Image') {
          steps{
            script {
              docker.withRegistry( '', registryCredential ) {
                dockerImage.push("$BUILD_NUMBER")
                dockerImage.push('latest')
              }
            }
          }
        }

        stage('Remove Unused docker image') {
          steps{
            sh "docker rmi $registry:$BUILD_NUMBER"
          }
        }

        stage('Kubernetes Deploy') {
	  agent { label 'EKS' }
            steps {
                    sh "helm upgrade --install --force Nodeapp helm/app --set appimage=${registry}:${BUILD_NUMBER} --namespace test"
            }
        }

    }


}
