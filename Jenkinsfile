pipeline {
  agent any
  stages {
    stage('Python Req.') {
      steps {
        sh 'python3 -m venv venv
        . venv/bin/activate
        make install'
      }
    }
    
    stage('Install Hadolint.') {
      steps {
        sh 'wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
            chmod +x /bin/hadolint'
      }
    }    

    stage('Lint') {
      steps {
        sh '. venv/bin/activate
        make lint'
      }
    }

  }
}
