pipeline {
  agent any
  stages {
    stage('Requirements') {
      steps {
        sh '''pipeline {
  agent any
  stages {
    stage(\'Python Req.\') {
      steps {
        sh \'make install\'
      }
    }

    stage(\'Python Lint\') {
      steps {
        sh \'pylint --disable=W0311 html_generator.py\'
      }
    }'''
        }
      }

    }
  }