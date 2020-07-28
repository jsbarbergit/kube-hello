pipeline {
  
  agent {
    node { 
    label 'go'
    customWorkspace '/mnt/shared_workspace/jbtest'
    }
  }

  environment {
    AWS_REGION           = "eu-west-2"

  }

  stages {
    // stage('list other containers') {
    //   steps {
    //     sh 'docker run --rm -v /var/run/docker.sock:/var/run/docker.sock docker:latest docker ps'
    //   }
    // }

    // stage('access metadata from non ecs container') {
    //   steps {
    //     sh 'docker run --rm -v /var/run/docker.sock:/var/run/docker.sock nginx:alpine curl http://169.254.169.254/latest/meta-data/iam/info'
    //   }
    // }


    // stage('Access metadata from ecs task') {
    //   steps {
    //     sh 'curl http://169.254.169.254/latest/meta-data/iam/info'
    //   }
    stage('Say Hello') {
      steps {
        sh '''
          echo "hello world"
          pwd
          ls -ail 
          ls -ail /mnt/shared_workspace
        '''
      }
    }
    stage('docker-test') {
      steps {
        sh '''
          pwd
          ls -ail 
          docker run --rm -v  $(pwd):/data cytopia/ansible ls -ail
        '''
      }
    }

    stage('Say Goodby') {
      steps {
        sh '''
          echo "bye bye"
          env
        '''        
      }
    }
  }
}