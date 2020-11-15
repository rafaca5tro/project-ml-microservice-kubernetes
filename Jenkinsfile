pipeline {
  agent any
  stages {
    stage('Requirements') {
      steps {
        sh '''    docker:
      # Use the same Docker base as the project
      - image: python:3.7.3-stretch

    working_directory: ~/repo

    steps:
      - checkout

      # Download and cache dependencies
      - restore_cache:
          keys:
            - v1-dependencies-{{ checksum "requirements.txt" }}
            # fallback to using the latest cache if no exact match is found
            - v1-dependencies-

      - run:
          name: install dependencies
          command: |
            python3 -m venv venv
            . venv/bin/activate
            make install
            # Install hadolint
            wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\\
            chmod +x /bin/hadolint
      - save_cache:
          paths:
            - ./venv
          key: v1-dependencies-{{ checksum "requirements.txt" }}'''
      }
    }

    stage('Lint') {
      steps {
        sh 'pylint --disable=W0311 html_generator.py'
      }
    }

    stage('Dockerization') {
      steps {
        sh '''# Step 1:
# Build image and add a descriptive tag
docker build --tag=mlapi .

# Step 2: 
# List docker images
docker image ls

# Step 3: 
# Run flask app
docker run -p 8000:80 mlapi'''
      }
    }

    stage('Upload image') {
      steps {
        sh '''# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath="vonbolan/mlapi"

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login &&\\
    docker image tag mlapi $dockerpath

# Step 3:
# Push image to a docker repository
docker image push $dockerpath'''
      }
    }

    stage('Containerization') {
      steps {
        sh '''dockerpath="vonbolan/mlapi"

# Run in Docker Hub container with kubernetes
#kubectl run \\
    #--generator=run-pod/v1 mlmicroservicesapi\\
    #--image=$dockerpath\\
    #--port=80 --labels app=mlmicroservicesapi
kubectl run --generator=run-pod/v1 mlmicroservicesapi --image=$dockerpath
#kubectl run --generator=run-pod/v1 mlmicroservicesapi --image=vonbolan/mlapi

# List kubernetes pods
kubectl get pods

# Forward the container port to host
kubectl port-forward mlmicroservicesapi 8000:80'''
      }
    }

  }
}