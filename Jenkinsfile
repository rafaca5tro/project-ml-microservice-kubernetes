pipeline {
  agent {
    dockerfile {
      filename 'python:3.7.3-stretch'
    }

  }
  stages {
    stage('Dependencies') {
      steps {
        sh 'bash ./lintpython.sh'
      }
    }

  }
}