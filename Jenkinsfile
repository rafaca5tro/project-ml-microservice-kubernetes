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
          image 'jenkins:1.596'
        }

      }
      steps {
        sh '''#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

docker run -u 0 --privileged --name jenkins -it -d -p 8080:8080 -p 50000:50000 \\
-v /var/run/docker.sock:/var/run/docker.sock \\
-v $(which docker):/usr/bin/docker \\
-v /home/jenkins_home:/var/jenkins_home \\
jenkins/jenkins:latest


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