pipeline {
  agent none
  stages {
    stage('Dependencies') {
      agent {
        docker { image 'python:3.7.3-stretch' }
      }
      steps {
        sh 'bash ./install.sh'
      }
    }
    stage('Lint') {
      agent {
        docker { image 'hadolint/hadolint' }
      }
      steps {
        sh 'bash ./lint.sh'
      }
    }
  }
}