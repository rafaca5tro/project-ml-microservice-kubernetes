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
apt-get install docker-ce docker-ce-cli containerd.io
docker run --rm -i hadolint/hadolint < Dockerfile
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