pipeline {
  agent {
    docker {
      image 'python:3.7.3-stretch'
    }

  }
  stages {
    stage('Dependencies') {
      steps {
            sh 'bash ./lintpython.sh'
        }  
      }
    }

    stage('Lint') {
      steps {
        sh '''. venv/bin/activate 
make lint'''
      }
    }

  }
}