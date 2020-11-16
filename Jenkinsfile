pipeline {
  agent {
    docker {
      image 'python:3.7.3-stretch'
    }

  }
  stages {
    stage('Dependencies') {
      steps {
        sh 'bash ./install.sh'
      }
    }

    stage('Lint') {
      steps {
        sh 'bash ./lint.sh'
      }
    }

  }
}