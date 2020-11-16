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

    stage('Install Hadolint') {
      steps {
        sh '''#!/bin/sh
sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64
sudo chmod +x /bin/hadolint
'''
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