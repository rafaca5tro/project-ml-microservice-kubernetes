pipeline {
  agent none
  stages {
    stage('Dependencies') {
      agent {
        docker {
          image 'python:3.7.3-stretch'
        }

      }
      steps {
        sh 'bash ./install.sh'
      }
    }

    stage('Hadolint') {
      agent {
        docker {
          image 'hadolint/hadolint'
        }

      }
      steps {
        sh 'hadolint Dockerfile'
      }
    }

    stage('Run Docker') {
      agent {
        docker {
          image 'jenkins:1.596'
        }

      }
      steps {
        sh 'bash ./run_docker.sh'
      }
    }

  }
}