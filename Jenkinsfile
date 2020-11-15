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
        sh '''#!/bin/bash
# Install hadolint
wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\\
chmod +x /bin/hadolint'''
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