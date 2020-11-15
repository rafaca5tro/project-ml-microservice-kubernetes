pipeline {
  agent {
    docker {
      image 'python:3.7.3-stretch'
    }

  }
  stages {
    stage('Requirements') {
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
        sh '''#!/bin/bash
. venv/bin/activate
make lint'''
      }
    }

  }
}