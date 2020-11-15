pipeline {
  agent any
  stages {
    stage('Requirements') {
      steps {
        sh 'FROM jenkins/jenkins:lts-alpine
        USER root
        RUN apk add — no-cache python3 && \
        python3 -m ensurepip && \
        pip3 install — upgrade pip setuptools && \
        pip3 install requirements.txt'
      }
    }

    stage('Install Hadolint') {
      steps {
        sh 'wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&            chmod +x /bin/hadolint'
      }
    }

    stage('Lint') {
      steps {
        sh '. venv/bin/make lint'
      }
    }

  }
}