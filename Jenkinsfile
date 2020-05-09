pipeline {
  agent any
  triggers    { pollSCM('H/5 * * * *') }
  environment { MESSAGE = 'Hello World' }
  stages {
    stage('てすと') {
      steps {
        sh 'echo HelloWorld'
      }
    }
    stage('すてーじ2') {
      steps {
        echo 'Hello'
      }
    }
    stage('てすと2') {
      steps {
        sh 'pwd'
      }
    }
    stage('てすと3') {
      steps {
        sh 'ls -al'
      }
    }
  }
}
