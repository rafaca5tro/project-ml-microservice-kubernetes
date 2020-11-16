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

    stage('PyLint') {
      agent {
        docker {
          image 'python:3.7.3-stretch'
        }

      }
      steps {
        sh 'bash ./pylint.sh'
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

  }
}