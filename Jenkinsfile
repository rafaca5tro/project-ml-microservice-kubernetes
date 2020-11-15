pipeline {
  agent any
  stages {
    stage('Requirements') {
      steps {
        sh '''stage(\'test\') {
     agent {
          docker {
               image \'python:3.7.3-stretch\'
          }
     }
     steps {
          sh \'virtualenv venv && . venv/bin/activate && pip install -r requirements.txt\'
     }
}'''
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