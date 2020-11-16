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
          image 'ubuntu:18.04'
        }

      }
      steps {
        sh 'bash ./dockerinstall.sh'
      }
      
          stage('Run Kubernetes') {
      agent {
        docker {
          image 'ubuntu:18.04'
        }

      }
      steps {
        sh 'bash ./kubernetes_run.sh'
      }
    }

  }
}
