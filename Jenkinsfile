pipeline {
  agent {
    docker {
      image 'python:3.7.3-stretch'
    }

  }
  stages {
    stage('Dependencies') {
      steps {
        sh '''#!/bin/bash
python3 -m venv venv
. venv/bin/activate
make install
'''
      }
    }

    stage('Lint') {
      steps {
        sh '''. venv/bin/activate 
hadolintw Dockerfile &&\\
pylint --disable=R,C,W1203,W1309 app.py '''
      }
    }

  }
}