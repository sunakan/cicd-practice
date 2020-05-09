pipeline {
  agent any
  triggers    { pollSCM('H/5 * * * *') }
  environment { MESSAGE = 'Hello World' }
  stages {
    stage('てすと') {
      steps {
        sh 'echo HelloWorld'
        sh 'echo HelloWorld'
        echo '${MESSAGE}'
      }
    }
  }
}
