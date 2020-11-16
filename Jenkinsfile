pipeline {
  agent none
  stages {
    stage('Dependencies') {
      agent {
        docker {
          image 'python:3.7.3-stretch'
        }

      }
      steps {
        sh 'bash ./install.sh'
      }
    }

    stage('Hadolint') {
      agent {
        docker {
          image 'hadolint/hadolint'
        }

      }
      steps {
        sh 'hadolint Dockerfile'
      }
    }

    stage('Run Docker') {
      agent {
        docker {
          image 'jenkins/jenkins:latest'
        }

      }
      steps {
        sh '''#!/usr/bin/env bash

## Complete the following steps to get Docker running locally


# Step 1:
# Build image and add a descriptive tag
docker build --tag=mlapi .

# Step 2: 
# List docker images
docker image ls

# Step 3: 
# Run flask app
docker run -p 8000:80 mlapi
'''
      }
    }

  }
}