pipeline {
  agent {
    docker {
      image 'python:3.7.3-stretch'
    }

  }
    stage('Lint') {
      steps {
        sh '''. venv/bin/activate 
make lint'''
      }
    }

  }