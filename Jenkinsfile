pipeline {
  agent {
    docker {
      image 'python:3.7.3-stretch'
    }

  }
    stage('Dependencies') {
      steps {
        sh 'bash ./lintpython.sh'
      }
    }

  }
}