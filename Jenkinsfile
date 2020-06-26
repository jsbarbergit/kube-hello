pipeline {
agent { label 'ecsagent' }

  environment {
    AWS_REGION           = "eu-west-2"

  }

  // For now, this is to get it running, it needs a lot of work
  // Do we want to run different things, or is the docker the main thing here?
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t johnbarber/kube-hello -f build/Dockerfile .'
      }
    }

    stage('Test') {
      steps {
        sh 'docker run --rm -v /var/run/docker.sock:/var/run/docker.sock nginx:alpine curl http://169.254.169.254/latest/meta-data/iam/info'
      }
    }
  }
}