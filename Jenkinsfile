pipeline {
  agent ecsagent

  environment {
    AWS_REGION           = "eu-west-2"

  }

  // For now, this is to get it running, it needs a lot of work
  // Do we want to run different things, or is the docker the main thing here?
  stages {
    stage('Hello') {
      steps {
        sh 'echo "HELLOWORLD'
      }
    }
  }
}