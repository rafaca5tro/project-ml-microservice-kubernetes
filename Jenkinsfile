pipeline {
  agent any
  stages {
    stage('Requirements') {
      steps {
        sh 'make install'
      }
    }
    
    stage('Install Hadolint') {
      steps {
        sh 'wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
            chmod +x /bin/hadolint'
      }
    }    

    stage('Lint') {
      steps {
        sh '. venv/bin/make lint'
      }
    }

  }
}
