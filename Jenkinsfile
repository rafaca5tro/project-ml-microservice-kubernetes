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
        sh \'pip3 install requirements\'
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